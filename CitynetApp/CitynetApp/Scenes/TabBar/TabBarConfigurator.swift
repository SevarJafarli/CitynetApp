//
//  TabBarConfigurator.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 19.03.24.
//

import UIKit

final class TabBarConfigurator {
    
    @discardableResult
    static func configure(_ viewController: TabBarViewController) -> TabBarViewController {
        let view = TabBarView()
        let interactor = TabBarInteractor()
        let presenter = TabBarPresenter()
        let router = TabBarRouter()
        
        viewController.mainView = view
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
