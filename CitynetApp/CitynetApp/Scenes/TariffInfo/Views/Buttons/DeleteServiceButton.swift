//
//  DeleteServiceButton.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 28.03.24.
//

import UIKit
import CitynetUIKit

class DeleteServiceButton: UIButton {

   //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = adaptiveColor(.appRed).cgColor
        
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        
        self.setTitle("Əlavəni sil", for: .normal)
        self.titleLabel?.font = AppFonts.SFCalloutSemibold.fontStyle
        self.setTitleColor(adaptiveColor(.appRed), for: .normal)
      

    
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
