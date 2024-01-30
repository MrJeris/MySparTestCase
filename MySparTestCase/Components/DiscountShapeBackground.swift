//
//  DiscountShapeBackground.swift
//  MySparTestCase
//
//  Created by Ruslan Magomedov on 30.01.2024.
//

import SwiftUI

struct DiscountShapeBackground: View {
    var body: some View {
        ShapeDiscount()
    }
}

struct ShapeDiscount: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.93442*width, y: 0.00141*height))
        path.addCurve(to: CGPoint(x: 0.0128*width, y: 0.2092*height), control1: CGPoint(x: 0.54008*width, y: 0.1913*height), control2: CGPoint(x: 0.32347*width, y: 0.24081*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.2301*height), control1: CGPoint(x: 0.0059*width, y: 0.2085*height), control2: CGPoint(x: 0, y: 0.21804*height))
        path.addLine(to: CGPoint(x: 0, y: 0.86328*height))
        path.addCurve(to: CGPoint(x: 0.00892*width, y: 0.88345*height), control1: CGPoint(x: 0, y: 0.87278*height), control2: CGPoint(x: 0.00365*width, y: 0.88107*height))
        path.addCurve(to: CGPoint(x: 0.99328*width, y: 0.82797*height), control1: CGPoint(x: 0.35896*width, y: 1.04156*height), control2: CGPoint(x: 0.76315*width, y: 1.05338*height))
        path.addCurve(to: CGPoint(x: 0.99915*width, y: 0.80777*height), control1: CGPoint(x: 0.99741*width, y: 0.82393*height), control2: CGPoint(x: 0.99967*width, y: 0.81598*height))
        path.addLine(to: CGPoint(x: 0.94968*width, y: 0.01923*height))
        path.addCurve(to: CGPoint(x: 0.93442*width, y: 0.00141*height), control1: CGPoint(x: 0.94888*width, y: 0.00641*height), control2: CGPoint(x: 0.94155*width, y: -0.00203*height))
        path.closeSubpath()
        return path
    }
}

#Preview {
    DiscountShapeBackground()
}
