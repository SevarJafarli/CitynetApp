//
//  AppDelegate.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 19.03.24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        App.router.start()
        return true
    }

}

