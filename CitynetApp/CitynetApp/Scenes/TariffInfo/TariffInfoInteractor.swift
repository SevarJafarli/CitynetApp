//
//  TariffInfoInteractor.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 27.03.24.
//

import UIKit

protocol TariffInfoBusinessLogic {
    
    func load(request: TariffInfo.Load.Request)
}

protocol TariffInfoDataStore {
    
    var tariffModel: TariffModel? { get set }
}

final class TariffInfoInteractor: TariffInfoBusinessLogic, TariffInfoDataStore {
   
    var tariffModel: TariffModel?
    
    
    var presenter: TariffInfoPresentationLogic?
    lazy var worker: TariffInfoWorkingLogic = TariffInfoWorker()
    
    // MARK: Business Logic
  
    func load(request: TariffInfo.Load.Request) {
        let response = TariffInfo.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
