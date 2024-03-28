//
//  HomePageRouter.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 22.03.24.
//

import UIKit

@objc protocol HomePageRoutingLogic {
    
    //func routeToSomewhere()
}

protocol HomePageDataPassing {
    var dataStore: HomePageDataStore? { get }
}

final class HomePageRouter: NSObject, HomePageRoutingLogic, HomePageDataPassing {
    
    weak var viewController: HomePageViewController?
    var dataStore: HomePageDataStore?
  
    
    // MARK: Routing

//    func routeToSomewhere() {
//        let destinationVC = SomewhereViewController()
//        SomewhereConfigurator.configure(destinationVC)
//
//        var destinationDS = destinationVC.router!.dataStore!
//        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//
//        navigateToSomewhere(source: viewController!, destination: destinationVC)
//    }

    
    // MARK: Navigation

//    func navigateToSomewhere(source: HomePageViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: HomePageDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
