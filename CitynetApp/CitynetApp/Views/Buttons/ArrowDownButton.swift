//
//  ArrowDownButton.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 02.04.24.
//

import UIKit

class ArrowDownButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = adaptiveColor(.dividerColor)
        self.layer.cornerRadius = 28
        self.clipsToBounds = true
        self.tintColor = .black
        self.setImage(.arrowDown, for: .normal)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let convertedPoint = self.convert(point, to: self)
        
        // If the point is inside the button's bounds, return the button
        if self.bounds.contains(convertedPoint) {
            return self
        }
        
        // If not, return nil to allow the system to find the appropriate view
        return nil
    }
}
