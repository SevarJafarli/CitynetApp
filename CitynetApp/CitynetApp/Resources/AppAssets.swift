//
//  AppAssets.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 19.03.24.
//

import UIKit

public enum AppAssets: String, CaseIterable {
    case add_file
    case add_money
    case apps
    case arrow_down
    case basket
    case calendar
    case headphones
    case home_add
    case home_wifi
    case home
    case logo
    case money_bag
    case notification
    case receipt
    case rocket
    case setting
    case shield_check
    case speed_test_bold
    case speed_test
    case speed
    case speed1
    case speed2
    case tag
    case trash
    case user
    case wallet
    case wallet_outlined
    case wifi
    case back
    case fiber
    case tvbox
    case phone_line
    case channel
    case info
    case help
    case ip
    case plus
    case minus
}

extension AppAssets {
    func load() -> UIImage? {
        return UIImage(named: self.rawValue)
    }
}
