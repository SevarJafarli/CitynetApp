//
//  HomePagePresenter.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 22.03.24.
//

import UIKit

protocol HomePagePresentationLogic {
    
    func presentLoad(response: HomePage.Load.Response)
}

final class HomePagePresenter: HomePagePresentationLogic {
    
    weak var viewController: HomePageDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: HomePage.Load.Response) {
        let viewModel = HomePage.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
