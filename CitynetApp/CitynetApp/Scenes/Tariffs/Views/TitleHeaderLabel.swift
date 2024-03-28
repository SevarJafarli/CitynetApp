//
//  TitleHeaderView.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 28.03.24.
//

import UIKit
import CitynetUIKit

class TitleHeaderLabel : UILabel {

   //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.text = "Tariflər"
        self.font = AppFonts.SFBoldLargeTitle.fontStyle
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
