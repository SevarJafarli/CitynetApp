//
//  HomePageRouter.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 22.03.24.
//

import UIKit

protocol HomePageRoutingLogic {
    
    func routeToProfitAddress()
    func routeToAddressDetail(with model: AddressModel)
}

protocol HomePageDataPassing {
    var dataStore: HomePageDataStore? { get }
}

final class HomePageRouter: NSObject, HomePageRoutingLogic, HomePageDataPassing {
    
    weak var viewController: HomePageViewController?
    var dataStore: HomePageDataStore?
  
    
    // MARK: Routing

    func routeToProfitAddress() {
        let destinationVC = ProfitAddressDetailViewController()
        
        ProfitAddressDetailConfigurator.configure(destinationVC)

        var destinationDS = destinationVC.router!.dataStore!
        passDataToProfitDetail(source: dataStore!, destination: &destinationDS)

        navigateToProfitDetail(source: viewController!, destination: destinationVC)
    }
    
    func routeToAddressDetail(with model: AddressModel) {
        let destinationVC = AddressDetailViewController()
        AddressDetailConfigurator.configure(destinationVC)
        dataStore?.addressModel = model
        var destinationDS = destinationVC.router!.dataStore!
        passDataToAddressDetail(source: dataStore!, destination: &destinationDS)

        navigateToAddressDetail(source: viewController!, destination: destinationVC)
    }

    
    // MARK: Navigation

    func navigateToProfitDetail(source: HomePageViewController, destination: ProfitAddressDetailViewController) {
        source.show(destination, sender: nil)
    }

    func navigateToAddressDetail(source: HomePageViewController, destination: AddressDetailViewController) {
        destination.hero.isEnabled = true
//        source.heroModalAnimationType = .
        source.present(destination, animated: true)
        
    }

    
//     MARK: Passing data

    func passDataToProfitDetail(source: HomePageDataStore, destination: inout ProfitAddressDetailDataStore) {
//        destination.name = source.name
    }
    
    func passDataToAddressDetail(source: HomePageDataStore, destination: inout AddressDetailDataStore) {
        destination.addressModel = source.addressModel
    }
}
