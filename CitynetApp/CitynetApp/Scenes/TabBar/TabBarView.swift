//
//  TabBarView.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 19.03.24.
//

import UIKit

protocol TabBarViewDelegate: AnyObject {
    
}

final class TabBarView: UIView {
    
    weak var delegate: TabBarViewDelegate?
    
    
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
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        //self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = .red
    }
}
