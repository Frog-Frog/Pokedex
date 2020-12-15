//
//  Easing.swift
//  Presentation
//
//  Created by masaki hasegawa on 2020/09/21.
//

import Foundation
import QuartzCore

enum Easing {

    enum EaseIn {
        case sine
        case quad
        case cubic
        case quart
        case quint
        case expo
        case circ
        case back

        var function: CAMediaTimingFunction {
            switch self {
            case .sine  : return CAMediaTimingFunction(controlPoints: 0.47, 0, 0.745, 0.715)
            case .quad  : return CAMediaTimingFunction(controlPoints: 0.55, 0.085, 0.68, 0.53)
            case .cubic : return CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
            case .quart : return CAMediaTimingFunction(controlPoints: 0.895, 0.03, 0.685, 0.22)
            case .quint : return CAMediaTimingFunction(controlPoints: 0.755, 0.05, 0.855, 0.06)
            case .expo  : return CAMediaTimingFunction(controlPoints: 0.95, 0.05, 0.795, 0.035)
            case .circ  : return CAMediaTimingFunction(controlPoints: 0.6, 0.04, 0.98, 0.335)
            case .back  : return CAMediaTimingFunction(controlPoints: 0.6, -0.28, 0.735, 0.045)
            }
        }

        // swiftlint:disable cyclomatic_complexity
        func getProgress(elapsed: TimeInterval, duration: TimeInterval, startValue: CGFloat, endValue: CGFloat) -> CGFloat {
            if elapsed < 0 {
                return startValue
            }
            if elapsed > duration {
                return endValue
            }

            var progress: CGFloat
            switch self {
            case .sine:
                let position = CGFloat(elapsed / duration)
                progress = CGFloat( -cos(position * .pi / 2) + 1.0 )
            case .quad:
                let position = CGFloat(elapsed / duration)
                progress = position * position
            case .cubic:
                let position = CGFloat(elapsed / duration)
                progress = position * position * position
            case .quart:
                let position = CGFloat(elapsed / duration)
                progress = position * position * position * position
            case .quint:
                let position = CGFloat(elapsed / duration)
                progress = position * position * position * position * position
            case .expo:
                progress = (elapsed == 0) ? 0.0 : CGFloat(pow(2.0, 10.0 * (elapsed / duration - 1.0)))
            case .circ:
                let position = CGFloat(elapsed / duration)
                progress = -(CGFloat(sqrt(1.0 - position * position)) - 1.0)
            case .back:
                let s: CGFloat = 1.70158
                let position = CGFloat(elapsed / duration)
                progress = CGFloat( position * position * ((s + 1.0) * position - s) )
            }

            if startValue > endValue {
                return startValue - abs(endValue - startValue) * progress
            } else {
                return startValue + abs(endValue - startValue) * progress
            }
        }
        // swiftlint:enable cyclomatic_complexity
    }

    enum EaseOut {
        case sine
        case quad
        case cubic
        case quart
        case quint
        case expo
        case circ
        case back

        var function: CAMediaTimingFunction {
            switch self {
            case .sine  : return CAMediaTimingFunction(controlPoints: 0.39, 0.575, 0.565, 1)
            case .quad  : return CAMediaTimingFunction(controlPoints: 0.25, 0.46, 0.45, 0.94)
            case .cubic : return CAMediaTimingFunction(controlPoints: 0.215, 0.61, 0.355, 1)
            case .quart : return CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
            case .quint : return CAMediaTimingFunction(controlPoints: 0.23, 1, 0.32, 1)
            case .expo  : return CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)
            case .circ  : return CAMediaTimingFunction(controlPoints: 0.075, 0.82, 0.165, 1)
            case .back  : return CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
            }
        }

        // swiftlint:disable cyclomatic_complexity
        func getProgress(elapsed: TimeInterval, duration: TimeInterval, startValue: CGFloat, endValue: CGFloat) -> CGFloat {
            if elapsed < 0 {
                return startValue
            }
            if elapsed > duration {
                return endValue
            }

            var progress: CGFloat
            switch self {
            case .sine:
                let position = CGFloat(elapsed / duration)
                progress = CGFloat( sin(position * .pi / 2) )
            case .quad:
                let position = CGFloat(elapsed / duration)
                progress = -position * (position - 2.0)
            case .cubic:
                let position = CGFloat(elapsed / duration) - 1
                progress = (position * position * position + 1.0)
            case .quart:
                let position = CGFloat(elapsed / duration) - 1
                progress = -(position * position * position * position - 1.0)
            case .quint:
                let position = CGFloat(elapsed / duration) - 1
                progress = (position * position * position * position * position + 1.0)
            case .expo:
                progress = (elapsed == duration) ? 1.0 : (-CGFloat(pow(2.0, -10.0 * elapsed / duration)) + 1.0)
            case .circ:
                let position = CGFloat(elapsed / duration) - 1
                progress = CGFloat( sqrt(1 - position * position) )
            case .back:
                let s: CGFloat = 1.70158
                let position = CGFloat(elapsed / duration - 1)
                progress = CGFloat( (position * position * ((s + 1.0) * position + s) + 1.0) )
            }

            if startValue > endValue {
                return startValue - abs(endValue - startValue) * progress
            } else {
                return startValue + abs(endValue - startValue) * progress
            }
        }
        // swiftlint:enable cyclomatic_complexity
    }

    enum EaseInOut {
        case sine
        case quad
        case cubic
        case quart
        case quint
        case expo
        case circ
        case back

        var function: CAMediaTimingFunction {
            switch self {
            case .sine  : return CAMediaTimingFunction(controlPoints: 0.445, 0.05, 0.55, 0.95)
            case .quad  : return CAMediaTimingFunction(controlPoints: 0.455, 0.03, 0.515, 0.955)
            case .cubic : return CAMediaTimingFunction(controlPoints: 0.645, 0.045, 0.355, 1)
            case .quart : return CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
            case .quint : return CAMediaTimingFunction(controlPoints: 0.86, 0, 0.07, 1)
            case .expo  : return CAMediaTimingFunction(controlPoints: 1, 0, 0, 1)
            case .circ  : return CAMediaTimingFunction(controlPoints: 0.785, 0.135, 0.15, 0.86)
            case .back  : return CAMediaTimingFunction(controlPoints: 0.68, -0.55, 0.265, 1.55)
            }
        }

        // swiftlint:disable cyclomatic_complexity
        // swiftlint:disable function_body_length
        func getProgress(elapsed: TimeInterval, duration: TimeInterval, startValue: CGFloat, endValue: CGFloat) -> CGFloat {
            if elapsed < 0 {
                return startValue
            }
            if elapsed > duration {
                return endValue
            }

            var progress: CGFloat
            switch self {
            case .sine:
                let position = CGFloat(elapsed / duration)
                progress = CGFloat( -0.5 * (cos(.pi * position) - 1.0) )
            case .quad:
                var position = CGFloat(elapsed / (duration / 2.0))
                if position < 1.0 {
                    progress = 0.5 * position * position
                } else {
                    position -= 1
                    progress = -0.5 * ((position) * (position - 2.0) - 1.0)
                }
            case .cubic:
                var position = CGFloat(elapsed / (duration / 2.0))
                if position < 1.0 {
                    progress = 0.5 * position * position * position
                } else {
                    position -= 2.0
                    progress = 0.5 * (position * position * position + 2.0)
                }
            case .quart:
                var position = CGFloat(elapsed / (duration / 2.0))
                if position < 1.0 {
                    progress = 0.5 * position * position * position * position
                } else {
                    position -= 2.0
                    progress = -0.5 * (position * position * position * position - 2.0)
                }
            case .quint:
                var position = CGFloat(elapsed / (duration / 2.0))
                if position < 1.0 {
                    progress = 0.5 * position * position * position * position * position
                } else {
                    position -= 2.0
                    progress = 0.5 * (position * position * position * position * position + 2.0)
                }
            case .expo:
                if elapsed == 0 {
                    progress = 0.0
                    break
                }
                if elapsed == duration {
                    progress = 1.0
                    break
                }

                var position = CGFloat(elapsed / (duration / 2.0))
                if position < 1.0 {
                    progress = CGFloat( 0.5 * pow(2.0, 10.0 * (position - 1.0)) )
                } else {
                    position -= 1
                    progress = CGFloat( 0.5 * (-pow(2.0, -10.0 * position) + 2.0) )
                }
            case .circ:
                var position = CGFloat(elapsed / (duration / 2.0))
                if position < 1.0 {
                    progress = CGFloat( -0.5 * (sqrt(1.0 - position * position) - 1.0) )
                } else {
                    position -= 2.0
                    progress = CGFloat( 0.5 * (sqrt(1.0 - position * position) + 1.0) )
                }
            case .back:
                let s: CGFloat = 1.70158 * 1.525
                var position = CGFloat(elapsed / (duration / 2.0))
                if position < 1.0 {
                    progress = CGFloat( 0.5 * (position * position * ((s + 1.0) * position - s)) )
                } else {
                    position -= 2.0
                    progress = CGFloat( 0.5 * (position * position * ((s + 1.0) * position + s) + 2.0) )
                }
            }

            if startValue > endValue {
                return startValue - abs(endValue - startValue) * progress
            } else {
                return startValue + abs(endValue - startValue) * progress
            }
        }
        // swiftlint:enable function_body_length
        // swiftlint:enable cyclomatic_complexity
    }
}
