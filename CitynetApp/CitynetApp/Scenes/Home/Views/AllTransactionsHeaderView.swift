//
//  AllTransactionsHeaderView.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 29.03.24.
//

import UIKit
import CitynetUIKit

class AllTransactionsHeaderView: UIView {

    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Bütün əməliyyatlar"
        lbl.font = AppFonts.SFTitle3Semibold.fontStyle
        lbl.textColor = adaptiveColor(.charcoalGrey01)
        return lbl
    }()
    
    private lazy var divider: AppDivider = {
        let view = AppDivider()
        view.backgroundColor = adaptiveColor(.dividerColor)
        return view
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubviews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.divider)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.titleLabel.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        self.divider.snp.remakeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-8)
        }
        
      
    }
}
