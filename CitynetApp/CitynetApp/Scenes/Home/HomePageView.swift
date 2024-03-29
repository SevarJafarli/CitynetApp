//
//  HomePageView.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 22.03.24.
//

import UIKit

protocol HomePageViewDelegate: AnyObject {
    
}

final class HomePageView: UIView {
    
    weak var delegate: HomePageViewDelegate?

    var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.backgroundColor = .white
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        
        view.layer.cornerRadius = 14
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        view.register(StoriesTableViewCell.self, forCellReuseIdentifier: StoriesTableViewCell.reuseIdentifier)
        view.register(TariffBannerTableViewCell.self, forCellReuseIdentifier: TariffBannerTableViewCell.reuseIdentifier)
        view.register(TransactionTableViewCell.self, forCellReuseIdentifier: TransactionTableViewCell.reuseIdentifier)
        
        view.register(NoTransactionTableViewCell.self, forCellReuseIdentifier: NoTransactionTableViewCell.reuseIdentifier)
        
//        view.layer.zPosition = 2
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
        
        self.tableView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(368)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        self.addSubview(self.tableView)
        self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.navBarColor)
    }
}



