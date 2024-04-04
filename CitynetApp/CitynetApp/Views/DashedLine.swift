//
//  DashedLine.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 02.04.24.
//

import UIKit

class DashedLineView: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: bounds.height / 2))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height / 2))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = adaptiveColor(.whiteLow20).cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3] // Specify the pattern as [dashLength, gapLength]
        shapeLayer.path = path.cgPath
        
        layer.addSublayer(shapeLayer)
    }
}
