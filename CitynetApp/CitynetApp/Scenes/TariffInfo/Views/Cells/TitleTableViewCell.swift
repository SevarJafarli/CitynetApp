//
//  TitleTableViewCell.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 28.03.24.
//

import UIKit
import CitynetUIKit

internal final class TitleTableViewCell: UITableViewCell {
    
    private var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Tarif haqqında"
        lbl.font = AppFonts.SFBoldLargeTitle.fontStyle
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell(with: .white)
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.contentView.addSubview(self.titleLabel)
        self.updateConstraints()
    }
    override func updateConstraints() {
        super.updateConstraints()
        
        self.titleLabel.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
