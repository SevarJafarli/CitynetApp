//
//  AddressDetailConfigurator.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 02.04.24.
//

import UIKit

final class AddressDetailConfigurator {
    
    @discardableResult
    static func configure(_ viewController: AddressDetailViewController) -> AddressDetailViewController {
        let view = AddressDetailView()
        let interactor = AddressDetailInteractor()
        let presenter = AddressDetailPresenter()
        let router = AddressDetailRouter()
        
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
