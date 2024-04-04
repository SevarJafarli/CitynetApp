//
//  HomePageView.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 22.03.24.
//
//


import UIKit

protocol HomePageViewDelegate: AnyObject {
}

final class HomePageView: UIView {
    
    weak var delegate: HomePageViewDelegate?
    
    private let navigationView: HomePageNavigationView = {
        let view = HomePageNavigationView()
        return view
    }()
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    
    
    lazy var addressesView: AddressesView = {
        let view = AddressesView(frame: .init(x: 0, y: 0, width: frame.width, height: 380.0))
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.backgroundColor = .white
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        
        
        view.register(StoriesTableViewCell.self, forCellReuseIdentifier: StoriesTableViewCell.reuseIdentifier)
        view.register(TariffBannerTableViewCell.self, forCellReuseIdentifier: TariffBannerTableViewCell.reuseIdentifier)
        view.register(TransactionTableViewCell.self, forCellReuseIdentifier: TransactionTableViewCell.reuseIdentifier)
        
        view.register(NoTransactionTableViewCell.self, forCellReuseIdentifier: NoTransactionTableViewCell.reuseIdentifier)
        
        view.tableHeaderView = addressesView
        
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        self.addSubviews()
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.navigationView.snp.updateConstraints { make in
            make.top.equalTo(self.safeAreaInsets.top)
            make.horizontalEdges.equalToSuperview()
        }
        
        
        //        self.addressesView.snp.updateConstraints { make in
        //            make.top.equalTo(self.navigationView.snp.bottom)
        //            make.horizontalEdges.equalToSuperview()
        //            make.height.equalTo(482)
        
        //        }
        
        self.tableView.snp.updateConstraints { make in
            make.top.equalTo(self.navigationView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        self.addSubview(self.navigationView)
        
        //        self.addSubview(self.backView)
        self.addSubview(self.tableView)
        
        //        self.sendSubviewToBack(backView)
        self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
    }
}



