//
//  AppContainer.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 19.03.24.
//

import Foundation
import CitynetUIKit
import CitynetNetworkKit

let App = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let theme = AppTheme()
    let service = Service()
}
