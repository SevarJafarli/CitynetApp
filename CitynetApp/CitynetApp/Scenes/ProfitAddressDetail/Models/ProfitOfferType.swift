//
//  ProfitOfferType.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 04.04.24.
//

import UIKit


enum ProfitOfferType: CaseIterable {
    
    case addBonus
    case sendBonus
    case spendBonus
    
    var image: UIImage? {
        switch self {
        case .addBonus:
            AppAssets.addBonus.load()
        case .sendBonus:
            AppAssets.sendBonus.load()
        case .spendBonus:
            AppAssets.spendBonus.load()
        }
    }
    
    var title: String {
        switch self {
        case .addBonus:
            "Hər gün 0.30 bonus topla"
        case .sendBonus:
            "Toplanan bonusları balansına köçür"
        case .spendBonus:
            "Topladığın bonusları xərclə"
        }
    }
    
    var subtitle: String {
        switch self {
        case .addBonus:
            """
Qeyd etdiyin əraziyə gələnə qədər hər gün 0.30 bonus topla.
*1 bonus = 1 AZN
"""
        case .sendBonus:
            "CityNet ünvanına qoşulduqdan sonra bonuslar dərhal balansında əks olunur."
        case .spendBonus:
            "Topladığın bütün bonusları tarifləri və xidmətləri ödəmək üçün istifadə et."
        }
    }
}
