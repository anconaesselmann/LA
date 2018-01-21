//  Created by Axel Ancona Esselmann on 2/7/17.
//  Copyright © 2017 Axel Ancona Esselmann. All rights reserved.
//

import UIKit

public struct LineaAlgebra {
    static func add(a: CGPoint, b: CGPoint) -> CGPoint {
        return CGPoint(x: a.x + b.x, y: a.y + b.y)
    }
    static func subtract(a: CGPoint, b: CGPoint) -> CGPoint {
        return CGPoint(x: a.x - b.x, y: a.y - b.y)
    }
    static func scalarMult(point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x * scalar, y: point.y * scalar)
    }
    static func scalarDiv(point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x / scalar, y: point.y / scalar)
    }
    static func scalarAdd(point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x + scalar, y: point.y + scalar)
    }
    static func lenght(point: CGPoint) -> CGFloat {
        return sqrt(point.x * point.x + point.y * point.y)
    }
    static func unit(point: CGPoint) -> CGPoint {
        let l = lenght(point: point)
        return scalarDiv(point: point, scalar: l)
    }
    static func orthUnit(point: CGPoint) -> CGPoint {
        let orth = CGPoint(x: -point.y, y: point.x)
        return unit(point: orth)
    }
    
    static func changeOfBasis(for point: CGPoint, newOrigin origin: CGPoint, pointOnXAxis xAxisPoint: CGPoint) -> CGPoint {
        let distanceC = point.x
        let orthogonalDistance = point.y
        
        let v      = subtract(a: origin, b: xAxisPoint)
        let vu     = unit(point: v)
        let pointC = subtract(a: origin, b: scalarMult(point: vu, scalar: distanceC))
        let vuOrth = orthUnit(point: v)
        return add(a: pointC, b: scalarMult(point: vuOrth, scalar: orthogonalDistance))
    }
}
