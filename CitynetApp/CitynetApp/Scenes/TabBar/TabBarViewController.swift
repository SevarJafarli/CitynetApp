//
//  TabBarViewController.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 19.03.24.
//

import UIKit
import CitynetUIKit

protocol TabBarDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: TabBar.Load.ViewModel)
}

final class TabBarViewController: UITabBarController, ThemeableViewController {
    
    var theme: ThemeProvider = App.theme
    
    var mainView: TabBarView?
    var interactor: TabBarBusinessLogic?
    var router: (TabBarRoutingLogic & TabBarDataPassing)?
  
    
    // MARK: - Lifecycle Methods
    
    fileprivate func setupTabBar() {
        self.tabBar.backgroundColor = adaptiveColor(.white)
        self.tabBar.unselectedItemTintColor = adaptiveColor(.slate)
        self.tabBar.tintColor = adaptiveColor(.deepCarmine500)
        self.tabBar.isTranslucent  = false
  
        let homeVC = MainNavigation(rootViewController: ViewController())
    
        homeVC.tabBarItem = UITabBarItem(title: "Ana səhifə", image: AppAssets.home.load(), tag: 0)
    
        let supportVC = UIViewController()
        supportVC.tabBarItem = UITabBarItem(title: "Dəstək", image: AppAssets.headphones.load(), tag: 1)
       
        let tariffsVC = MainNavigation(rootViewController: TariffsConfigurator.configure(TariffsViewController()))
        
        tariffsVC.isTranslucent = false
       
        tariffsVC.barTintColor = .white
        
        tariffsVC.tabBarItem = UITabBarItem(title: "Tariflər", image: AppAssets.tag.load(), tag: 2)

        let moreVC = UIViewController()
        moreVC.tabBarItem = UITabBarItem(title: "Daha çox", image: AppAssets.apps.load(), tag: 3)
       
        
        let controllers: [UIViewController] = [homeVC, supportVC, tariffsVC, moreVC]
        
        self.viewControllers = controllers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.load()
        
        
        self.setupTabBar()
    }
  
    
    // MARK: - Public Methods
  
    func load() {
        let request = TabBar.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension TabBarViewController: TabBarDisplayLogic {
    
    func displayLoad(viewModel: TabBar.Load.ViewModel) {
        
    }
}

// MARK: - View Delegate

extension TabBarViewController: TabBarViewDelegate {
    
}
