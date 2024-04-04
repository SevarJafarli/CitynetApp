//
//  AppDivider.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 28.03.24.
//

import UIKit

class AppDivider: UIView {
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupDivider()
        
        self.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setupDivider() {
        self.backgroundColor = adaptiveColor(.borderColor)
    }

}
