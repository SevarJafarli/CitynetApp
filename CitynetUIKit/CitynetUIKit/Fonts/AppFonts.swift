//
//  AppFonts.swift
//  CitynetUIKit
//
//  Created by Sevar Jafarli on 19.03.24.
//

import UIKit

//TODO: change

public enum AppFonts {
    case SFFootnoteSemibold
    case SFCaption1Medium
    case SFTitle3Semibold
    case SFFootnoteRegular
    case SFCalloutSemibold
    case SFSubheadlineSemibold
    case SFBodySemibold
    case SFBoldLargeTitle
}

extension AppFonts {
    public var fontStyle: UIFont {
        
        switch self {
        case .SFFootnoteSemibold:
            .systemFont(ofSize: 13, weight: .semibold)
        case .SFCaption1Medium:
            .systemFont(ofSize: 12, weight: .regular)
        case .SFTitle3Semibold:
                .systemFont(ofSize: 20, weight: .semibold)
        case .SFFootnoteRegular:
                .systemFont(ofSize: 13, weight: .regular)
        case .SFCalloutSemibold:
                .systemFont(ofSize: 16, weight: .semibold)
        case .SFSubheadlineSemibold:
                .systemFont(ofSize: 15, weight: .semibold)
        case .SFBodySemibold:
                .systemFont(ofSize: 17, weight: .semibold)
        case .SFBoldLargeTitle:
                .systemFont(ofSize: 34, weight: .bold)
        }
    }
}
