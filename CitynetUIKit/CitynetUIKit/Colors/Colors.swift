//
//  Colors.swift
//  CitynetUIKit
//
//  Created by Sevar Jafarli on 19.03.24.


import UIKit

public enum ColorStyle: String, CaseIterable {
    
    case bgColor
    case cardGrey
    case charcoalGrey01
    case charcoalGrey02
    case charcoalGrey03
    case deepCarmine500
    case gravelGrey01
    case green
    case slate
    case whiteLow
    case whiteLow20
    case white
    case whiteBg
    case cardShadowColor
    case lightCarmine
    case lightBlue
    case lightYellow
    case lightGrey
    case borderColor
    case dividerColor
    case appRed
}

extension ColorStyle {
    public func load() -> UIColor? {
        if #available(iOS 13.0, *) {
            return UIColor(named: self.rawValue, in: bundle, compatibleWith: .current)
        } else {
            return UIColor(named: self.rawValue, in: bundle, compatibleWith: nil)
        }
    }
}

