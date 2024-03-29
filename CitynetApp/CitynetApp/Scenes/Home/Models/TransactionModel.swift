//
//  TransactionModel.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 29.03.24.
//

import UIKit
import CitynetUIKit

internal struct TransactionModel {
    let title: String
    let amount: Double
    let date: String
    let type: TransactionType
}

internal enum TransactionType {
    case monthlyPayment
    case topUp
    
    var title: String {
        switch self {
        case .monthlyPayment:
            "Aylıq ödəniş"
        case .topUp:
            "Balans artımı"
        }
    }
    
    var iconImage: UIImage? {
        switch self {
        case .monthlyPayment:
            AppAssets.monthlyPayment.load()
        case .topUp:
            AppAssets.add_money.load()
        }
    }
    
    var amountColor: ColorStyle {
        switch self {
        case .monthlyPayment:
            ColorStyle.charcoalGrey01
        case .topUp:
            ColorStyle.green
        }
    }
}
