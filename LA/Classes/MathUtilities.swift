//  Created by Axel Ancona Esselmann on 11/23/19.
//  Copyright © 2019 Axel Ancona Esselmann. All rights reserved.
//

import UIKit

public typealias Vector2D = CGPoint
public typealias Velocity = CGPoint
public typealias Acceleration = CGPoint
public typealias AngularVelocity = Radian
public typealias AngularAcceleration = Radian

public extension CGPoint {

    init(x: Int = 0, y: Int = 0) {
        self.init(x: Double(x), y: Double(y))
    }

    init(x: Double = 0) {
        self.init(x: CGFloat(x), y: 0)
    }

    init(y: Double = 0) {
        self.init(x: 0, y: CGFloat(y))
    }

    init(_ size: CGSize) {
        self.init(x: size.width, y: size.height)
    }

    func x(_ x: Double) -> CGPoint {
        return CGPoint(x: CGFloat(x), y: self.y)
    }

    func x(_ x: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: self.y)
    }

    func y(_ y: Double) -> CGPoint {
        return CGPoint(x: self.x, y: CGFloat(y))
    }

    func y(_ y: CGFloat) -> CGPoint {
        return CGPoint(x: self.x, y: y)
    }

    func multiplying(_ multiplier: CGFloat) -> CGPoint {
        return CGPoint(x: x * multiplier, y: y * multiplier)
    }

    func multiplying(_ multiplier: Double) -> CGPoint {
        return multiplying(CGFloat(multiplier))
    }

    func dotProduct(_ vector: CGPoint) -> CGFloat {
        return x * vector.x + y * vector.y
    }

    func dividing(_ divisor: CGFloat) -> CGPoint {
        return CGPoint(x: x / divisor, y: y / divisor)
    }

    func dividing(_ divisor: Double) -> CGPoint {
        return dividing(CGFloat(divisor))
    }

    func adding(_ point: CGPoint) -> CGPoint {
        return CGPoint(
            x: x + point.x,
            y: y + point.y)
    }

    func subtracting(_ point: CGPoint) -> CGPoint {
        return CGPoint(
            x: x - point.x,
            y: y - point.y)
    }

    var length: CGFloat {
        return sqrt(x * x + y * y)
    }

    func distance(to point: CGPoint) -> CGFloat {
        return (point - self).length
    }

    static var unitX: CGPoint {
        return CGPoint(x: 1)
    }
    static var unitY: CGPoint {
        return CGPoint(y: 1)
    }

    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return lhs.adding(rhs)
    }

    static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return lhs.subtracting(rhs)
    }

    static func *(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return lhs.multiplying(rhs)
    }

    static func *(lhs: CGPoint, rhs: Double) -> CGPoint {
        return lhs.multiplying(rhs)
    }

    static func *(lhs: CGPoint, rhs: CGPoint) -> CGFloat {
        return lhs.dotProduct(rhs)
    }

    static func /(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return lhs.dividing(rhs)
    }

    static func /(lhs: CGPoint, rhs: Double) -> CGPoint {
        return lhs.dividing(rhs)
    }

    static func +=(left: inout CGPoint, right: CGPoint) {
        left = left + right
    }

    static func -=(left: inout CGPoint, right: CGPoint) {
        left = left - right
    }

    static func *=(left: inout CGPoint, right: Double) {
        left = left * right
    }

    static func *=(left: inout CGPoint, right: CGFloat) {
        left = left * right
    }

    static func /=(left: inout CGPoint, right: Double) {
        left = left / right
    }

    static func /=(left: inout CGPoint, right: CGFloat) {
        left = left / right
    }

    // Unary
    static prefix func - (point: CGPoint) -> CGPoint {
        return CGPoint(x: -point.x, y: -point.y)
    }

    var isNaN: Bool {
        return x.isNaN || y.isNaN
    }

    var hasMagnitude: Bool {
        return !isNaN && (self != .zero)
    }
}

public extension Double {

    static var π: Double {
        return Double.pi
    }

    static var twoπ: Double {
        return Double.pi * 2.0
    }

    var yVelocity: Velocity {
        return Velocity(y: self)
    }
    var xVelocity: Velocity {
        return Velocity(x: self)
    }
}

public extension CGFloat {

    static var π: CGFloat {
        return CGFloat.pi
    }

    static var twoπ: CGFloat {
        return CGFloat.pi * 2.0
    }

    static func <(lhs: CGFloat, rhs: Double) -> Bool {
        return lhs < CGFloat(rhs)
    }

    static func >(lhs: CGFloat, rhs: Double) -> Bool {
        return lhs > CGFloat(rhs)
    }

    static func ==(lhs: CGFloat, rhs: Double) -> Bool {
        return lhs == CGFloat(rhs)
    }

}

public extension Double {
    var cgFloat: CGFloat {
        return CGFloat(self)
    }

    func shortestAngle(with angle2: Double) -> Double {
        var angle = (angle2 - self)
            .truncatingRemainder(dividingBy: .twoπ)
        if angle >= .π || angle <= -.π {
            angle += .twoπ
        }
        return angle
    }
}

public extension CGFloat {
    var double: Double {
        return Double(self)
    }

    func shortestAngle(with angle2: CGFloat) -> CGFloat {
        return CGFloat(self.double.shortestAngle(with: angle2.double))
    }

    var asRadian: Radian {
        return Radian(self)
    }
}


public struct Radian: CustomStringConvertible {

    public enum Sign {
        case plus
        case minus

        public func apply(_ radian: Radian) -> Radian {
            switch self {
            case .plus:
                return radian
            case .minus:
                return -radian
            }
        }
    }

    public var description: String {
        return "\(radian) radian"
    }

    public var asCGFloat: CGFloat {
        return CGFloat(radian)
    }

    public var asDouble: Double {
        return radian
    }

    public var sign: Sign {
        return radian >= 0 ? .plus : .minus
    }

    public static var pi: Radian {
        return Radian(Double.pi)
    }

    public static var π: Radian {
        return Radian(Double.pi)
    }

    public static var twoPi: Radian {
        return Radian(Double.pi * 2)
    }

    public static var twoπ: Radian {
        return Radian(Double.pi * 2)
    }

    public static var zero: Radian {
        return Radian(0.0)
    }

    public var notZero: Bool {
        return !isZero
    }

    private static var zeroError = 0.0001
    public var isZero: Bool {
        return
            radian == 0 ||
            ((radian < 0 && radian > -Radian.zeroError) ||
            (radian > 0 && radian < Radian.zeroError))
    }

    private var radian: Double

    public init(_ radian: Double) {
        self.radian = radian
    }

    public init(_ radian: CGFloat) {
        self.radian = Double(radian)
    }

    public static func *(lhs: Radian, rhs: Radian) -> Radian {
        return Radian(lhs.asDouble * rhs.asDouble)
    }

    public static func *(lhs: Radian, rhs: Double) -> Radian {
        return Radian(lhs.asDouble * rhs)
    }

    public static func *(lhs: Radian, rhs: CGFloat) -> Radian {
        return Radian(lhs.asDouble * Double(rhs))
    }

    public static func <(lhs: Radian, rhs: Radian) -> Bool {
        return lhs.asDouble < rhs.asDouble
    }

    public static func >(lhs: Radian, rhs: Radian) -> Bool {
        return lhs.asDouble > rhs.asDouble
    }

    public static func ==(lhs: Radian, rhs: Radian) -> Bool {
        return lhs.asDouble == rhs.asDouble
    }

    public static func !=(lhs: Radian, rhs: Radian) -> Bool {
        return lhs.asDouble != rhs.asDouble
    }

    public static func >=(lhs: Radian, rhs: Radian) -> Bool {
        return lhs.asDouble >= rhs.asDouble
    }

    public static func <=(lhs: Radian, rhs: Radian) -> Bool {
        return lhs.asDouble <= rhs.asDouble
    }

    public static prefix func -(radian: Radian) -> Radian {
        return Radian(-radian.asDouble)
    }

    public static func +(lhs: Radian, rhs: Radian) -> Radian {
        return Radian(lhs.radian + rhs.radian)
    }

    public static func -(lhs: Radian, rhs: Radian) -> Radian {
        return Radian(lhs.radian - rhs.radian)
    }

    public static func +=(left: inout Radian, right: Radian) {
        left = left + right
    }

    public static func -=(left: inout Radian, right: Radian) {
        left = left - right
    }

    public func shortestAngle(with angle2: Radian) -> Radian {
        return Radian(self.asDouble.shortestAngle(with: angle2.asDouble))
    }

    public func truncatingRemainder(dividingBy other: Radian) -> Radian {
        return Radian(self.asDouble.truncatingRemainder(dividingBy: other.asDouble))
    }

    public func truncatingRemainder(dividingBy other: Double) -> Radian {
        return Radian(self.asDouble.truncatingRemainder(dividingBy: other))
    }

}

public extension CGPoint {

    enum RotationOrientation {
        case equal
        case clockwise
        case counterClockwise
        case opposite

        public func apply(_ radian: Radian) -> Radian {
            switch self {
            case .clockwise:
                return abs(radian)
            case .counterClockwise:
                return -abs(radian)
            case .equal:
                return radian
            case .opposite:
                return radian
            }
        }
    }

    func orientation(of vector: Vector2D) -> RotationOrientation {
        // TODO: Deal with multiples of π
        let angle = angleCC(with: vector)
        if angle == .zero {
            return .equal
        } else if angle == .pi {
            return .opposite
        } else if angle > .zero {
            return .counterClockwise
        } else {
            return .clockwise
        }
    }

    var angle: Radian {
        return Radian(atan2(y, x))
    }

    func rotated(by angle: Radian) -> Self {
        let ca = cos(angle).cgFloat
        let sa = sin(angle).cgFloat
        return CGPoint(
            x: ca * x - sa * y,
            y: sa * x + ca * y)
    }

    // Smallest angle between two vectors
    func angle(with vector: CGPoint) -> Radian {
        return Radian(acos((self * vector) / (abs(self.length) * abs(vector.length))))
    }

    // Angle between two vectors in a counterclockwise direction
    func angleCC(with vector: CGPoint) -> Radian {
        return Radian(atan2(x * vector.y - y * vector.x, self * vector))
    }

}

public func abs(_ radian: Radian) -> Radian {
    return Radian(abs(radian.asDouble))
}

public func min(_ radian1: Radian, _ radian2: Radian) -> Radian {
    return Radian(min(radian1.asDouble, radian2.asDouble))
}


public func cos(_ angle: Radian) -> Double {
    return cos(angle.asDouble)
}
public func sin(_ angle: Radian) -> Double {
    return sin(angle.asDouble)
}
