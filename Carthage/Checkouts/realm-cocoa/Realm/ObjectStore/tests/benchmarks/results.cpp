////////////////////////////////////////////////////////////////////////////
//
// Copyright 2019 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////

#define CATCH_CONFIG_ENABLE_BENCHMARKING

#include "util/test_file.hpp"
#include "util/test_utils.hpp"

#include "binding_context.hpp"
#include "object_schema.hpp"
#include "property.hpp"
#include "results.hpp"
#include "schema.hpp"

#include <realm/group_shared.hpp>
#include <realm/query_engine.hpp>
#include <realm/query_expression.hpp>

using namespace realm;

TEST_CASE("Benchmark results", "[benchmark]") {
    InMemoryTestFile config;
    config.cache = false;
    config.schema = Schema{
        {"object", {
            {"value", PropertyType::Int},
            {"bool", PropertyType::Bool},
            {"data prop", PropertyType::Data},
            {"link", PropertyType::Object|PropertyType::Nullable, "object 2"},
            {"array", PropertyType::Object|PropertyType::Array, "object 2"},
        }},
        {"object 2", {
            {"value", PropertyType::Int},
            {"link", PropertyType::Object|PropertyType::Nullable, "object"},
        }},
    };

    auto realm = Realm::get_shared_realm(config);
    auto table = realm->read_group().get_table("class_object");
    auto table2 = realm->read_group().get_table("class_object 2");
    Results r(realm, *table);

    realm->begin_transaction();
    table->add_empty_row(4);
    table2->add_empty_row(4);
    for (int i = 0; i < 4; ++i) {
        table->set_int(0, i, (i + 2) % 4);
        table->set_bool(1, i, i % 2);
        table->set_link(3, i, 3 - i);

        table2->set_int(0, i, (i + 1) % 4);
        table2->set_link(1, i, i);
    }
    realm->commit_transaction();
    /*
     | index | value | bool | link.value | link.link.value |
     |-------|-------|------|------------|-----------------|
     | 0     | 2     | 0    | 0          | 1               |
     | 1     | 3     | 1    | 3          | 0               |
     | 2     | 0     | 0    | 2          | 3               |
     | 3     | 1     | 1    | 1          | 2               |
     */

    #define REQUIRE_ORDER(sort, ...) do { \
        std::vector<size_t> expected = {__VA_ARGS__}; \
        auto results = sort; \
        REQUIRE(results.size() == expected.size()); \
        for (size_t i = 0; i < expected.size(); ++i) \
            REQUIRE(results.get(i).get_index() == expected[i]); \
    } while (0)

    SECTION("basics") {

        REQUIRE(r.filter(Query(table->where().less(0, 2))).size() == 2);
        BENCHMARK("basic filter") {
            return r.filter(Query(table->where().less(0, 2))).size();
        };

        REQUIRE_ORDER((r.sort({{"value", true}})), 2, 3, 0, 1);
        BENCHMARK("sort simple ints") {
            return r.sort({{"value", true}});
        };

        REQUIRE_ORDER((r.sort({{"bool", true}, {"value", true}})), 2, 0, 3, 1);
        BENCHMARK("sort over two properties") {
            return r.sort({{"bool", true}, {"value", true}});
        };

        REQUIRE_ORDER((r.sort({{"link.value", true}})), 0, 3, 2, 1);
        BENCHMARK("sort over link") {
            return r.sort({{"link.value", true}});
        };

        REQUIRE_ORDER((r.sort({{"link.link.value", true}})), 1, 0, 3, 2);
        BENCHMARK("sort over two links") {
            return r.sort({{"link.link.value", true}});
        };

        REQUIRE(r.distinct({{"value"}}).size() == 4);
        BENCHMARK("distinct ints") {
            return r.distinct({{"value"}});
        };

        REQUIRE(r.distinct({{"bool"}}).size() == 2);
        BENCHMARK("distinct bool") {
            return r.distinct({{"bool"}});
        };
    }
}

