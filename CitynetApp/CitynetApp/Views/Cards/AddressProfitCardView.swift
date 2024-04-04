//
//  AddressProfitCardView.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 03.04.24.
//

import UIKit
import CitynetUIKit

class AddressProfitCardView: UIView {
    
    private let backImageView: UIImageView = {
        let imgView = UIImageView(image: .profitBg)
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 16
        imgView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return imgView
    }()
    
    private lazy var walletView: ProfitWalletView = {
        let view = ProfitWalletView(image: .profitWallet)
        return view
        
    }()
    
    private let bottomSeeMoreView: BottomSeeMoreView = {
        let view = BottomSeeMoreView(title: "Ətraflı bax")
        return view
    }()
    
    
    private let coin1 = CoinView()
    private let coin2 = CoinView()
    private let coin3 = CoinView()
   
    
    
    lazy var cardWidth = UIScreen.main.bounds.width - 32
    
    lazy var firstPosition = (cardWidth - 256)/2 + 20
    
    lazy var secondPosition = firstPosition + 256/2 - 40
    lazy var thirdPosition = secondPosition + 256/2 - 40

    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        
        self.addSubviews()
        
        animateCoins()

    }
    
    func resetCoinPositions() {
        self.coin1.frame = .init(x: firstPosition, y: -40, width: 40, height: 40)
        self.coin2.frame = .init(x: secondPosition, y: -40, width: 40, height: 40)
        self.coin3.frame = .init(x: thirdPosition, y: -40, width: 40, height: 40)
    }
    
    
    func animateCoins() {
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .curveEaseIn],  animations: {
                 self.coin1.frame = CGRect(x: self.firstPosition, y: 120, width: 40, height: 40)
               })
                       
        UIView.animate(withDuration: 1, delay: 0.2, options: [.repeat, .curveEaseIn],  animations: {
                           self.coin3.frame = CGRect(x: self.thirdPosition, y: 120, width: 40, height: 40)
                              })
        
        UIView.animate(withDuration: 1, delay: 0.4, options: [.repeat, .curveEaseIn],  animations: {
            self.coin2.frame = CGRect(x: self.secondPosition, y: 120, width: 40, height: 40)
        })
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        self.backgroundColor = .white
        self.layer.borderWidth = 1
        self.layer.borderColor = adaptiveColor(.borderColor).cgColor
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
    }
    
    private func addSubviews() {
        self.addSubview(self.backImageView)
        
        self.addSubview(self.bottomSeeMoreView)
    
       resetCoinPositions()
        self.addSubview(self.coin1)
        self.addSubview(self.coin2)
        self.addSubview(self.coin3)
        
        
        self.addSubview(self.walletView)
        
        
       
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.backImageView.snp.updateConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(200)
        }
        
        self.bottomSeeMoreView.snp.updateConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        
        self.walletView.snp.updateConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
