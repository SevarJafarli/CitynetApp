//
//  HomePageConfigurator.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 22.03.24.
//

import UIKit

final class HomePageConfigurator {
    
    @discardableResult
    static func configure(_ viewController: HomePageViewController) -> HomePageViewController {
        let view = HomePageView()
        let interactor = HomePageInteractor()
        let presenter = HomePagePresenter()
        let router = HomePageRouter()
        
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
