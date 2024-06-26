//
//  TariffInfoView.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 27.03.24.
//

import UIKit
import CitynetUIKit

protocol TariffInfoViewDelegate: AnyObject {
    
}

final class TariffInfoView: UIView {
    
    weak var delegate: TariffInfoViewDelegate?
    
    var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.setupTableView()
        view.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.reuseIdentifier)
        view.register(ToastTableViewCell.self, forCellReuseIdentifier: ToastTableViewCell.reuseIdentifier)
        view.register(TariffTableViewCell.self, forCellReuseIdentifier: TariffTableViewCell.reuseIdentifier)
        view.register(AdditionalServiceViewCell.self, forCellReuseIdentifier: AdditionalServiceViewCell.reuseIdentifier)
        return view
    }()
    
    private var bottomCheckoutView: TariffInfoBottomCheckoutView = {
        let view = TariffInfoBottomCheckoutView()
      
        return view
    }()
    
    //MARK: Init
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        self.bottomCheckoutView.snp.updateConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        let size = bottomCheckoutView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        let height = size.height
        
        self.tableView.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-24).offset(-height)
        }

        super.updateConstraints()
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
       
        self.addSubview(self.tableView)
        
        self.addSubview(self.bottomCheckoutView)
        
        self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = .white
    }
}
