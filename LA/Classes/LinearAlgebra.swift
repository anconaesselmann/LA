//  Created by Axel Ancona Esselmann on 2/7/17.
//  Copyright © 2017 Axel Ancona Esselmann. All rights reserved.
//

import UIKit

public func add(a: CGPoint, b: CGPoint) -> CGPoint {
    return CGPoint(x: a.x + b.x, y: a.y + b.y)
}
public func subtract(a: CGPoint, b: CGPoint) -> CGPoint {
    return CGPoint(x: a.x - b.x, y: a.y - b.y)
}
public func scalarMult(point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}
public func scalarDiv(point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}
public func scalarAdd(point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x + scalar, y: point.y + scalar)
}
public func lenght(point: CGPoint) -> CGFloat {
    return sqrt(point.x * point.x + point.y * point.y)
}
public func unit(point: CGPoint) -> CGPoint {
    let l = lenght(point: point)
    return scalarDiv(point: point, scalar: l)
}

public func unitVector(from point1: CGPoint, to point2: CGPoint) -> CGPoint {
    let offset = CGPoint(
        x: point2.x - point1.x,
        y: point2.y - point1.y)
    return unit(point: offset)
}

public func orthUnit(point: CGPoint) -> CGPoint {
    let orth = CGPoint(x: -point.y, y: point.x)
    return unit(point: orth)
}

public func changeOfBasis(for point: CGPoint, newOrigin origin: CGPoint, pointOnXAxis xAxisPoint: CGPoint) -> CGPoint {
    let distanceC = point.x
    let orthogonalDistance = point.y

    let v      = subtract(a: origin, b: xAxisPoint)
    let vu     = unit(point: v)
    let pointC = subtract(a: origin, b: scalarMult(point: vu, scalar: distanceC))
    let vuOrth = orthUnit(point: v)
    return add(a: pointC, b: scalarMult(point: vuOrth, scalar: orthogonalDistance))
}

public extension CGSize {
    var center: CGSize {
        return CGSize(width: width / 2.0, height: height / 2.0)
    }

    var point: CGPoint {
        return CGPoint(self)
    }
}

public extension CGPoint {

    var unit: CGPoint {
        return LA.unit(point: self)
    }

    func unit(to point: CGPoint) -> CGPoint {
        return LA.unitVector(from: self, to: point)
    }

    var orthUnit: CGPoint {
        return LA.orthUnit(point: self)
    }

    func changeOfBasis(newOrigin: CGPoint, pointOnXAxis xAxisPoint: CGPoint) -> CGPoint {
        return LA.changeOfBasis(for: self, newOrigin: newOrigin, pointOnXAxis: xAxisPoint)
    }

}
