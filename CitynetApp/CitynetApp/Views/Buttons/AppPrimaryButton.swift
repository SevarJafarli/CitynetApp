//
//  AppPrimaryButton.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 27.03.24.
//

import UIKit
import CitynetUIKit

class AppPrimaryButton: UIButton {
        
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupButton() {
        self.backgroundColor = adaptiveColor(.deepCarmine500)
        self.tintColor = .white
        self.layer.cornerRadius = 12
        self.titleLabel?.font = AppFonts.SFCalloutSemibold.fontStyle

    }
}
