//
//  AppRouter.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 19.03.24.
//

import UIKit

final class AppRouter {
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        self.main()

    }

    func main() {
        let viewController = TabBarViewController()
        let view = TabBarConfigurator.configure(viewController)
        self.window.rootViewController = view
        self.window.makeKeyAndVisible()
    }
}
