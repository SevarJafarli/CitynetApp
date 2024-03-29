////
////  HomePageViewController.swift
////  CitynetApp
////
////  Created by Sevar Jafarli on 22.03.24.
////
//
import UIKit
//
protocol HomePageDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: HomePage.Load.ViewModel)
}
final class HomePageViewController: UIViewController {
    
    var mainView: HomePageView?
    var interactor: HomePageBusinessLogic?
    var router: (HomePageRoutingLogic & HomePageDataPassing)?
    
    var initialTableViewTopConstraint: CGFloat = 368
    var maxScrollOffset: CGFloat = 100
    
    var transactions: [TransactionModel] = [
        .init(title: "Bakı, Aşıq Alı 40", amount: 17.99, date: "23 May 2023", type: .monthlyPayment),
        .init(title: "Bakı, Aşıq Alı 40", amount: 37.99, date: "20 May 2023", type: .topUp),
        .init(title: "Bakı, Aşıq Alı 40", amount: 10.99, date: "21 May 2023", type: .monthlyPayment),
        .init(title: "Bakı, Aşıq Alı 40", amount: 17.99, date: "23 May 2023", type: .topUp),
        .init(title: "Bakı, Aşıq Alı 40", amount: 17.99, date: "23 May 2023", type: .monthlyPayment),
        .init(title: "Bakı, Aşıq Alı 45", amount: 17.99, date: "23 May 2023", type: .topUp),
        .init(title: "Bakı, Aşıq Alı 40", amount: 17.99, date: "23 May 2023", type: .monthlyPayment),
        .init(title: "Bakı, Aşıq Alı 40", amount: 17.99, date: "23 May 2023", type: .topUp),
    ]
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        self.view = mainView
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: AppAssets.logo.load()?.withTintColor(.brown, renderingMode: .alwaysTemplate), style: .done, target: self, action: nil)
        
        self.navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: AppAssets.notification.load(), style: .done, target: self, action: nil)
        
        self.load()
        
        mainView?.tableView.delegate = self
        mainView?.tableView.dataSource = self
        mainView?.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    
    // MARK: - Public Methods
    
    func load() {
        let request = HomePage.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension HomePageViewController: HomePageDisplayLogic {
    
    func displayLoad(viewModel: HomePage.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension HomePageViewController: HomePageViewDelegate {
    
}

// MARK: - TableView Delegate & DataSource

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        Sections.allCases.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections.allCases[section] {
        case .stories, .tariffBanner:
            1
        case .allOperations:
            self.transactions.isEmpty ? 1 : self.transactions.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Sections.allCases[indexPath.section] {
        case .stories:
            let cell = tableView.dequeueReusableCell(withIdentifier: StoriesTableViewCell.reuseIdentifier, for: indexPath)
            
            return cell
        case .tariffBanner:
            let cell = tableView.dequeueReusableCell(withIdentifier: TariffBannerTableViewCell.reuseIdentifier, for: indexPath) as! TariffBannerTableViewCell
            return cell
            
        case .allOperations:
            
            if self.transactions.isEmpty {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: NoTransactionTableViewCell.reuseIdentifier, for: indexPath) as! NoTransactionTableViewCell
                
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.reuseIdentifier, for: indexPath) as! TransactionTableViewCell
                
                cell.model = self.transactions[indexPath.row]
                return cell
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Sections.allCases[indexPath.section] {
        case .stories:
            152.0 + 32.0 // collectionview height + content insets from top and bottom
        default:
            UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch Sections.allCases[section] {
        case .allOperations:
            AllTransactionsHeaderView()
        default:
            nil
        }
    }

}
