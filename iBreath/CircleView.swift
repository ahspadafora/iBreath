//
//  CircleView.swift
//  iBreath
//
//  Created by Amber Spadafora on 10/24/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    private var circleRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * 0.5
    }
    private var circleCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    func getCirclePath()->UIBezierPath {
        let path = UIBezierPath(arcCenter: circleCenter, radius: circleRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        path.lineWidth = 8.0
        return path
    }
    
    override func draw(_ rect: CGRect) {
        let lineColor = Colors.blue
        lineColor.set()
        getCirclePath().stroke()
    }
    
}
