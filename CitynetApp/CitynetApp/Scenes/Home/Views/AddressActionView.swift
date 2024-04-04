//
//  AddressActionView.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 01.04.24.
//

import UIKit
import CitynetUIKit

typealias AddressAction = AddressActionView.Action

final internal class AddressActionView: UIStackView {
    
    //MARK: Action
    
    enum Action: CaseIterable {
        case activateGun
        case activateTurbo
        case topUp
        
        var icon: UIImage? {
            switch self {
            case .activateGun:
                AppAssets.money_bag.load()
            case .activateTurbo:
                AppAssets.rocket.load()
            case .topUp:
                AppAssets.wallet.load()
            }
        }
        
        var title: String {
            switch self {
            case .activateGun:
                "“Gün+” aktivləşdir"
            case .activateTurbo:
                "Turbo aktivləşdir"
            case .topUp:
                "Balans artır"
            }
        }
    }

    
    var action: AddressAction? {
        didSet {
            configure()
        }
    }
    
    //MARK: Init
    
    private lazy var actionButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .lightGray
        btn.layer.cornerRadius = 28
        btn.tintColor = .white
        return btn
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFFootnoteRegular.fontStyle
        lbl.numberOfLines = 0
        lbl.textColor = .white
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.alignment = .center
        self.axis = .vertical
        self.spacing = 8
        self.addSubviews()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubviews() {
        self.updateConstraints()
        
        self.addArrangedSubview(self.actionButton)
        self.addArrangedSubview(self.titleLabel)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.actionButton.snp.updateConstraints { make in
            make.width.height.equalTo(56)
        }
    }
    
    private func configure() {
        guard let action = action else { return }
        
        self.actionButton.setImage(action.icon, for: .normal)
        self.titleLabel.text = action.title
    }
}
