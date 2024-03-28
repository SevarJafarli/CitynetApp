//
//  AdditionalServicesSectionHeaderView.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 28.03.24.
//

import UIKit
import CitynetUIKit

class AdditionalServicesSectionHeaderView: UIView {
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Əlavə xidmətlərimiz"
        lbl.font = AppFonts.SFFootnoteSemibold.fontStyle
        lbl.textColor = adaptiveColor(.slate)
        return lbl
    }()
    
    private var miniHelpBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(AppAssets.help.load(), for: .normal)
        return btn
    }()
    
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubviews()
    }
    required init(coder: NSCoder) {
        fatalError()
    }

    private func addSubviews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.miniHelpBtn)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.titleLabel.snp.updateConstraints { make in
            make.top.leading.bottom.equalToSuperview()
        }
        self.miniHelpBtn.snp.updateConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(self.titleLabel.snp.trailing).offset(4)
            make.width.height.equalTo(20)
        }
    }
}
