//
//  ProfitAddressDetailPresenter.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 03.04.24.
//

import UIKit

protocol ProfitAddressDetailPresentationLogic {
    
    func presentLoad(response: ProfitAddressDetail.Load.Response)
}

final class ProfitAddressDetailPresenter: ProfitAddressDetailPresentationLogic {
    
    weak var viewController: ProfitAddressDetailDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: ProfitAddressDetail.Load.Response) {
        let viewModel = ProfitAddressDetail.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
