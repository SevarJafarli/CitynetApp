//
//  AppWhiteButton.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 01.04.24.
//

import UIKit
import CitynetUIKit

class AppLighterButton: UIButton {
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .darkGray
        self.layer.cornerRadius = 8
        self.setTitleColor(.white, for: .normal)
//        self.titleEdgeInsets = .init(top: <#T##CGFloat#>, left: <#T##CGFloat#>, bottom: <#T##CGFloat#>, right: <#T##CGFloat#>)
        self.titleLabel?.font = AppFonts.SFFootnoteRegular.fontStyle
       
        self.semanticContentAttribute = .forceRightToLeft
        
        self.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
