//
//  TariffCellTopView.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 27.03.24.
//

import UIKit
import CitynetUIKit

class TariffCellTopView: UIView {

    var title: String? {
        didSet {
            configure()
        }
    }
    //MARK: Init
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = adaptiveColor(.charcoalGrey01)
        label.font = AppFonts.SFTitle3Semibold.fontStyle
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        self.layer.cornerRadius = 14
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    private func addSubviews() {
        self.addSubview(self.nameLabel)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.nameLabel.snp.updateConstraints { make in
            make.verticalEdges.equalToSuperview().inset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    private func configure() {
        guard let title = title else { return }
        self.nameLabel.text = title
    }
    
}

