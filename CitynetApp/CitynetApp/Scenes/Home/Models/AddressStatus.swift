//
//  AddressStatus.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 01.04.24.
//

import UIKit
import CitynetUIKit

enum AddressStatus {
    case active
    case pending
    
    var title: String {
        switch self {
        case .active:
            "Aktiv"
        case .pending:
            "Gözləmədə"
        }
    }
    
    var color: UIColor? {
        switch self {
        case .active:
            ColorStyle.green.load()
        case .pending:
            UIColor.systemBlue
        }
    }
}
