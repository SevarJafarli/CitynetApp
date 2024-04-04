//
//  AddressDetailPresenter.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 02.04.24.
//

import UIKit

protocol AddressDetailPresentationLogic {
    
    func presentLoad(response: AddressDetail.Load.Response)
}

final class AddressDetailPresenter: AddressDetailPresentationLogic {
    
    weak var viewController: AddressDetailDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: AddressDetail.Load.Response) {
        let viewModel = AddressDetail.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
