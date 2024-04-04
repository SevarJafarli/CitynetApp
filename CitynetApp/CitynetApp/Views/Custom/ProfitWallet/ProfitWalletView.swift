//
//  ProfitWalletView.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 03.04.24.
//

import UIKit
import CitynetUIKit

class ProfitWalletView: UIView {
    
    let image: UIImage

    
    private lazy var walletImage: UIImageView = {
        let view = UIImageView(image: image)
        return view
    }()

    private let contentView : ProfitWalletContentView = {
        let view = ProfitWalletContentView()

        return view
    }()
    

    
    //MARK: Init
    
    init(image: UIImage) {
        self.image = image
        super.init(frame: .zero)

        self.addSubviews()
        
       
    
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.addSubview(self.walletImage)
        self.walletImage.addSubview(self.contentView)
        
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.walletImage.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width - 32)
            make.height.equalTo(220)
        }
        
        self.contentView.snp.updateConstraints { make in
            make.verticalEdges.equalToSuperview().inset(32)
            make.horizontalEdges.equalToSuperview().inset(40)
        }
    }
}




class CoinView: UIView {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "coin")

        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.imageView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.height.width.equalTo(40)
        }
    }
}

