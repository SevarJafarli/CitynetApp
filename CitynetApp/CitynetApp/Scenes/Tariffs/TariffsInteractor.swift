//
//  TariffsInteractor.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 27.03.24.
//

import UIKit

protocol TariffsBusinessLogic {
    
    func load(request: Tariffs.Load.Request)
}

protocol TariffsDataStore {
    
    var tariffModel: TariffModel? { get set }
    //var name: String { get set }
}

final class TariffsInteractor: TariffsBusinessLogic, TariffsDataStore {
    
    
    var presenter: TariffsPresentationLogic?
    lazy var worker: TariffsWorkingLogic = TariffsWorker()
    var tariffModel: TariffModel?
  
    // MARK: Business Logic
  
    func load(request: Tariffs.Load.Request) {
        let response = Tariffs.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
