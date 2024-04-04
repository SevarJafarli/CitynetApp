//
//  HomePageNavigationView.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 01.04.24.
//

import UIKit
import CitynetUIKit

class HomePageNavigationView: UIView {

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .equalSpacing
        return view
    }()
    
    private let appLogo: UIImageView = {
        let view = UIImageView(image: AppAssets.logo.load())
        view.tintColor = .white
        
        return view
    }()
    
    private let notificationBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(AppAssets.notification.load(), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    private let notificationCountLabel: NotificationCountLabel = {
        let label = NotificationCountLabel(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        label.text = "5"
         return label
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = adaptiveColor(.navBarColor)
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubviews() {
        
        
        self.addSubview(self.stackView)
        
        self.stackView.addArrangedSubview(self.appLogo)
        
        self.notificationBtn.addSubview(self.notificationCountLabel)
        
        self.stackView.addArrangedSubview(self.notificationBtn)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.stackView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        self.notificationBtn.snp.updateConstraints { make in
            make.width.height.equalTo(24)
        }
        
        self.notificationCountLabel.snp.updateConstraints { make in
            make.trailing.equalTo(self.notificationBtn.snp.centerX).offset(2)
            make.top.equalTo(self.notificationBtn).offset(-6)
            make.width.height.equalTo(16)
        }
    }
}

