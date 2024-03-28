//
//  View+Extension.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 27.03.24.
//

import UIKit
import CitynetUIKit

extension UIView: ThemeableView {
    var theme: ThemeProvider {
        App.theme
    }
}
