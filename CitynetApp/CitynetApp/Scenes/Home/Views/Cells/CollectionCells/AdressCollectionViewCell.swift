//
//  AdressCollectionViewCell.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 29.03.24.
//

import UIKit


class AdressCollectionViewCell: UICollectionViewCell {
    
    var addressModel: AddressModel? {
        didSet {
            configure()
        }
    }
    
    private lazy var profitCardView: AddressProfitCardView = {
        let view = AddressProfitCardView()
        return view
    }()
    
    private let actionsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 48
        return view
    }()
    
    private lazy var addressCardView: AddressCardView = {
        let view = AddressCardView(type: .basic)
        return view
    }()
    
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.hero.id = "addressCard"
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func configure() {
        
        guard let addressModel else { return }
        
        switch addressModel.addressType {
        case .available:
            setupAddressCard()
            
        case .notAvailable:
            setupProfitCard()
        }
        
        self.addressCardView.model = addressModel
    }
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        //        actionsStackView.arrangedSubviews.map { subview -> Void in
        //            actionsStackView.removeArrangedSubview(subview)
        //            subview.removeFromSuperview()
        //        }
    }
    
    private func setupAddressCard() {
        self.contentView.addSubview(self.addressCardView)
        
        self.addressCardView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
    private func setupProfitCard() {
        self.contentView.addSubview(self.profitCardView)
        
        self.profitCardView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
}
