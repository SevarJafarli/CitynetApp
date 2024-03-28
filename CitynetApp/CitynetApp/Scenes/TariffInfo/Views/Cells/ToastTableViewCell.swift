//
//  ToastTableViewCell.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 28.03.24.
//

import UIKit

internal final class ToastTableViewCell: UITableViewCell {
    
    private var toastView: TariffInfoToastView = {
        let view = TariffInfoToastView()
        return view
    }()
    
    
    //MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell(with: .white)
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    private func addSubviews() {
        self.contentView.addSubview(self.toastView)
        self.updateConstraints()
    }
    override func updateConstraints() {
        super.updateConstraints()
        
        self.toastView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
