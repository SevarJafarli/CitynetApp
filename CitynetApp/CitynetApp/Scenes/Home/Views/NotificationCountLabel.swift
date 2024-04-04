//
//  NotificationCountLabel.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 02.04.24.
//

import UIKit
import CitynetUIKit

class NotificationCountLabel: UILabel {
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupLabel() {
        self.layer.cornerRadius = self.bounds.size.height / 2
        self.textAlignment = .center
        self.layer.masksToBounds = true
        self.textColor = .black
        self.font = AppFonts.SFCaption2Semibold.fontStyle
        self.backgroundColor = .white
    }
}
