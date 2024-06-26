//
//  AddressInfoType.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 01.04.24.
//

import UIKit

//MARK: AddressModel

//TODO : make them optional

struct AddressModel {
    let addressType: AddressType
    let status: AddressStatus
    let address: String
    
    let tariffName: String
    let renewalDate: String
    let monthlyPayment: Double
    let balance: Double
    let subscriptions:  String
    let additions: [String]
    let subscriberID: String
}

enum AddressType {
    case available
    case notAvailable
}

enum AddressInfoType {
    case address
    case tariff
    case renewalDate
    case monthlyPayment
    case balance
    case subscriptions
    case additions
    case subscriberID
    
    var title: String {
        switch self {
        case .address:
            "Ünvan"
        case .tariff:
            "Tarif"
        case .renewalDate:
            "Yenilənmə tarixi"
        case .monthlyPayment:
            "Aylıq ödəniş"
        case .balance:
            "CityNet Balans"
        case .subscriptions:
            "Abunəliklər"
        case .additions:
            "Əlavələr"
        case .subscriberID:
            "Abonent ID"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .address:
            AppAssets.home_wifi.load()
        case .tariff:
            AppAssets.speed_test.load()
        case .renewalDate:
            AppAssets.calendar.load()
        case .monthlyPayment:
            AppAssets.receipt.load()
        case .balance:
            AppAssets.wallet_outlined.load()
        case .subscriptions:
            AppAssets.home_add.load()
        case .additions:
            AppAssets.basket.load()
        case .subscriberID:
            AppAssets.shield_check.load()
        }
    }
}
