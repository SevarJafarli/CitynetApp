//
//  NoTransactionTableViewCell.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 29.03.24.
//

import UIKit
import CitynetUIKit

class NoTransactionTableViewCell: UITableViewCell {
    
    private let contentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        return view
    }()
    
    private let noTransactionimageView: UIImageView = {
        let view = UIImageView(image: AppAssets.add_file.load())
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Əməliyyat olmayıb"
        lbl.font = AppFonts.SFCalloutSemibold.fontStyle
        lbl.textColor = adaptiveColor(.charcoalGrey01)
        return lbl
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Tarif seçərək əməliyyatlara başlaya bilərsən."
        lbl.font = AppFonts.SFFootnoteRegular.fontStyle
        lbl.textColor = adaptiveColor(.slate)
        return lbl
    }()
    
    //MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupCell(with: .white)
        self.addSubviews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubviews() {
        self.contentStackView.addArrangedSubview(self.noTransactionimageView)
        self.contentStackView.setCustomSpacing(24, after: self.noTransactionimageView)
        self.contentStackView.addArrangedSubview(self.titleLabel)
        self.contentStackView.setCustomSpacing(8, after: self.titleLabel)
        self.contentStackView.addArrangedSubview(self.subtitleLabel)
        self.contentView.addSubview(self.contentStackView)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.contentStackView.snp.updateConstraints { make in
            make.verticalEdges.equalToSuperview().inset(80)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        self.noTransactionimageView.snp.updateConstraints { make in
            make.width.height.equalTo(80)
        }
    }
}
