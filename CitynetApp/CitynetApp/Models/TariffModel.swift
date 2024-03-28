//
//  TariffModel.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 27.03.24.
//


import UIKit
import CitynetUIKit

struct TariffModel {
    let name: String
    let image: UIImage?
    let type: TariffModelType
    let tariffInfos: [TariffInfoType]
    let price: String
    
}

enum TariffModelType {
    case internet
    case internetAndTV
    case internetAndTVAndPhoneLine
    
    var color: UIColor? {
        switch self {
        case .internet:
            ColorStyle.lightBlue.load()
        case .internetAndTV:
            ColorStyle.lightYellow.load()
        case .internetAndTVAndPhoneLine:
            ColorStyle.lightCarmine.load()
        }
    }
}

enum TariffInfoType {
    case fiberOptic
    case speed(amount: String)
    case freeWifiRouter
    case tvBox
    case channels(count: Int)
    case homePhoneLine
    
    var image: UIImage? {
        switch self {
        case .fiberOptic:
            AppAssets.fiber.load()
        case .speed(_):
            AppAssets.speed_test_bold.load()
        case .freeWifiRouter:
            AppAssets.wifi.load()
        case .tvBox:
            AppAssets.tvbox.load()
        case .channels(_):
            AppAssets.channel.load()
        case .homePhoneLine:
            AppAssets.phone_line.load()
        }
    }
    
    var title: String {
        switch self {
        case .fiberOptic:
            "Fiber optik"
        case .speed(let amount):
            "\(amount) sürət"
        case .freeWifiRouter:
            "Wi-Fi ruter (PULSUZ)"
        case .tvBox:
            "TV Box"
        case .channels(let count):
            "\(count) kanal"
        case .homePhoneLine:
            "Ev telefonu xətti"
        }
    }
}
