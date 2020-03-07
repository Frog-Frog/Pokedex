/*
 *  Created by Martin on 07/11/2017.
 *
 * Distributed under the Boost Software License, Version 1.0. (See accompanying
 * file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
 */

#include "catch_matchers_floating.h"
#include "catch_enforce.h"
#include "catch_polyfills.hpp"
#include "catch_to_string.hpp"
#include "catch_tostring.h"

#include <algorithm>
#include <cmath>
#include <cstdlib>
#include <cstdint>
#include <cstring>
#include <sstream>
#include <type_traits>
#include <iomanip>
#include <limits>


namespace Catch {
namespace {

    int32_t convert(float f) {
        static_assert(sizeof(float) == sizeof(int32_t), "Important ULP matcher assumption violated");
        int32_t i;
        std::memcpy(&i, &f, sizeof(f));
        return i;
    }

    int64_t convert(double d) {
        static_assert(sizeof(double) == sizeof(int64_t), "Important ULP matcher assumption violated");
        int64_t i;
        std::memcpy(&i, &d, sizeof(d));
        return i;
    }

    template <typename FP>
    bool almostEqualUlps(FP lhs, FP rhs, uint64_t maxUlpDiff) {
        // Comparison with NaN should always be false.
        // This way we can rule it out before getting into the ugly details
        if (Catch::isnan(lhs) || Catch::isnan(rhs)) {
            return false;
        }

        auto lc = convert(lhs);
        auto rc = convert(rhs);

        if ((lc < 0) != (rc < 0)) {
            // Potentially we can have +0 and -0
            return lhs == rhs;
        }

        auto ulpDiff = std::abs(lc - rc);
        return static_cast<uint64_t>(ulpDiff) <= maxUlpDiff;
    }

} //end anonymous namespace

#if defined(CATCH_CONFIG_GLOBAL_NEXTAFTER)

#if defined(__clang__)
#pragma clang diagnostic push
// The long double overload is currently unused
#pragma clang diagnostic ignored "-Wunused-function"
#endif

    float nextafter(float x, float y) {
        return ::nextafterf(x, y);
    }

    double nextafter(double x, double y) {
        return ::nextafter(x, y);
    }

    long double nextafter(long double x, long double y) {
        return ::nextafterl(x, y);
    }

#if defined(__clang__)
#pragma clang diagnostic pop
#endif

#endif // ^^^ CATCH_CONFIG_GLOBAL_NEXTAFTER ^^^

namespace {

template <typename FP>
FP step(FP start, FP direction, uint64_t steps) {
    for (uint64_t i = 0; i < steps; ++i) {
#if defined(CATCH_CONFIG_GLOBAL_NEXTAFTER)
        start = Catch::nextafter(start, direction);
#else
        start = std::nextafter(start, direction);
#endif
    }
    return start;
}

namespace {

    // Performs equivalent check of std::fabs(lhs - rhs) <= margin
    // But without the subtraction to allow for INFINITY in comparison
    bool marginComparison(double lhs, double rhs, double margin) {
        return (lhs + margin >= rhs) && (rhs + margin >= lhs);
    }

}

} // end anonymous namespace

namespace Matchers {
namespace Floating {

    enum class FloatingPointKind : uint8_t {
        Float,
        Double
    };


    WithinAbsMatcher::WithinAbsMatcher(double target, double margin)
        :m_target{ target }, m_margin{ margin } {
        CATCH_ENFORCE(margin >= 0, "Invalid margin: " << margin << '.'
            << " Margin has to be non-negative.");
    }

    // Performs equivalent check of std::fabs(lhs - rhs) <= margin
    // But without the subtraction to allow for INFINITY in comparison
    bool WithinAbsMatcher::match(double const& matchee) const {
        return (matchee + m_margin >= m_target) && (m_target + m_margin >= matchee);
    }

    std::string WithinAbsMatcher::describe() const {
        return "is within " + ::Catch::Detail::stringify(m_margin) + " of " + ::Catch::Detail::stringify(m_target);
    }


    WithinUlpsMatcher::WithinUlpsMatcher(double target, uint64_t ulps, FloatingPointKind baseType)
        :m_target{ target }, m_ulps{ ulps }, m_type{ baseType } {
        CATCH_ENFORCE(m_type == FloatingPointKind::Double
                   || m_ulps < std::numeric_limits<uint32_t>::max(),
            "Provided ULP is impossibly large for a float comparison.");
    }

#if defined(__clang__)
#pragma clang diagnostic push
// Clang <3.5 reports on the default branch in the switch below
#pragma clang diagnostic ignored "-Wunreachable-code"
#endif

    bool WithinUlpsMatcher::match(double const& matchee) const {
        switch (m_type) {
        case FloatingPointKind::Float:
            return almostEqualUlps<float>(static_cast<float>(matchee), static_cast<float>(m_target), m_ulps);
        case FloatingPointKind::Double:
            return almostEqualUlps<double>(matchee, m_target, m_ulps);
        default:
            CATCH_INTERNAL_ERROR( "Unknown FloatingPointKind value" );
        }
    }

#if defined(__clang__)
#pragma clang diagnostic pop
#endif

    std::string WithinUlpsMatcher::describe() const {
        std::stringstream ret;

        ret << "is within " << m_ulps << " ULPs of " << ::Catch::Detail::stringify(m_target);

        if (m_type == FloatingPointKind::Float) {
            ret << 'f';
        }

        ret << " ([";
        ret << std::fixed << std::setprecision(std::numeric_limits<double>::max_digits10);
        if (m_type == FloatingPointKind::Double) {
            ret << step(m_target, static_cast<double>(-INFINITY), m_ulps)
                << ", "
                << step(m_target, static_cast<double>(INFINITY), m_ulps);
        } else {
            ret << step<float>(static_cast<float>(m_target), -INFINITY, m_ulps)
                << ", "
                << step<float>(static_cast<float>(m_target), INFINITY, m_ulps);
        }
        ret << "])";

        return ret.str();
        //return "is within " + Catch::to_string(m_ulps) + " ULPs of " + ::Catch::Detail::stringify(m_target) + ((m_type == FloatingPointKind::Float)? "f" : "");
    }

    WithinRelMatcher::WithinRelMatcher(double target, double epsilon):
        m_target(target),
        m_epsilon(epsilon){
        CATCH_ENFORCE(m_epsilon >= 0., "Relative comparison with epsilon <  0 does not make sense.");
        CATCH_ENFORCE(m_epsilon  < 1., "Relative comparison with epsilon >= 1 does not make sense.");
    }

    bool WithinRelMatcher::match(double const& matchee) const {
        const auto relMargin = m_epsilon * std::max(std::fabs(matchee), std::fabs(m_target));
        return marginComparison(matchee, m_target,
                                std::isinf(relMargin)? 0 : relMargin);
    }

    std::string WithinRelMatcher::describe() const {
        Catch::ReusableStringStream sstr;
        sstr << "and " << m_target << " are within " << m_epsilon * 100. << "% of each other";
        return sstr.str();
    }

}// namespace Floating



Floating::WithinUlpsMatcher WithinULP(double target, uint64_t maxUlpDiff) {
    return Floating::WithinUlpsMatcher(target, maxUlpDiff, Floating::FloatingPointKind::Double);
}

Floating::WithinUlpsMatcher WithinULP(float target, uint64_t maxUlpDiff) {
    return Floating::WithinUlpsMatcher(target, maxUlpDiff, Floating::FloatingPointKind::Float);
}

Floating::WithinAbsMatcher WithinAbs(double target, double margin) {
    return Floating::WithinAbsMatcher(target, margin);
}

Floating::WithinRelMatcher WithinRel(double target, double eps) {
    return Floating::WithinRelMatcher(target, eps);
}

Floating::WithinRelMatcher WithinRel(double target) {
    return Floating::WithinRelMatcher(target, std::numeric_limits<double>::epsilon() * 100);
}

Floating::WithinRelMatcher WithinRel(float target, float eps) {
    return Floating::WithinRelMatcher(target, eps);
}

Floating::WithinRelMatcher WithinRel(float target) {
    return Floating::WithinRelMatcher(target, std::numeric_limits<float>::epsilon() * 100);
}


} // namespace Matchers
} // namespace Catch

