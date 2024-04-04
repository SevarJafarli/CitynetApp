//
//  HomePageInteractor.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 22.03.24.
//

import UIKit

protocol HomePageBusinessLogic {
    
    func load(request: HomePage.Load.Request)
}

protocol HomePageDataStore {
    
    var addressModel: AddressModel? { get set }
}

final class HomePageInteractor: HomePageBusinessLogic, HomePageDataStore {
    var addressModel: AddressModel?
    
    
    var presenter: HomePagePresentationLogic?
    lazy var worker: HomePageWorkingLogic = HomePageWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: HomePage.Load.Request) {
        let response = HomePage.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
