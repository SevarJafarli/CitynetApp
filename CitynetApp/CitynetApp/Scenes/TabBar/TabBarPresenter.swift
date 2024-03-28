//
//  TabBarPresenter.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 19.03.24.
//

import UIKit

protocol TabBarPresentationLogic {
    
    func presentLoad(response: TabBar.Load.Response)
}

final class TabBarPresenter: TabBarPresentationLogic {
    
    weak var viewController: TabBarDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: TabBar.Load.Response) {
        let viewModel = TabBar.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
