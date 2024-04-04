//
//  TariffBannerTableViewCell.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 29.03.24.
//

import UIKit
import CitynetUIKit


protocol TariffBannerTableViewCellDelegate: AnyObject {
    func goToTariffTab()
}

class TariffBannerTableViewCell: UITableViewCell {
    
    weak var delegate: TariffBannerTableViewCellDelegate?
    
    
    private lazy var tariff1 = tariffImage(image: AppAssets.speed.load(), size: .init(width: 88, height: 88))
    private lazy var tariff2 = tariffImage(image: AppAssets.speed1.load(), size: .init(width: 102, height: 102))
    private lazy var tariff3 = tariffImage(image: AppAssets.speed.load(), size: .init(width: 88, height: 88))
    
    
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = adaptiveColor(.lightCarmine)
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.clipsToBounds = true
        return view
    }()
    
    private let imagesView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    private lazy var seeButton: AppPrimaryButton = {
        let btn = AppPrimaryButton()
        btn.setTitle("Tariflərə bax", for: .normal)
        btn.addTarget(self, action: #selector(goToTariffTab), for: .touchUpInside)
        return btn
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Yüksək sürətli internet tarifləri"
        lbl.font = AppFonts.SFTitle3Semibold.fontStyle
        lbl.textColor = adaptiveColor(.charcoalGrey01)
        lbl.textAlignment = .center
        return lbl
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Lorem Ipsum is simply dummy"
        lbl.font = AppFonts.SFFootnoteRegular.fontStyle
        lbl.textColor = adaptiveColor(.charcoalGrey03)
        lbl.textAlignment = .center
        return lbl
    }()
    
    private func tariffImage(image: UIImage?, size: CGSize) -> UIImageView {
        let imgView = UIImageView(image: image)
        imgView.frame = .init(x: 0, y: 0, width: size.width, height: size.height)
        
        return imgView
    }
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell(with: .white)
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubviews() {
        
        self.imagesView.addSubview(self.tariff1)
        self.imagesView.addSubview(self.tariff3)
        self.imagesView.addSubview(self.tariff2)
        
        self.cardView.addSubview(self.imagesView)
        self.cardView.addSubview(self.titleLabel)
        self.cardView.addSubview(self.subtitleLabel)
        self.cardView.addSubview(self.seeButton)
        
        self.contentView.addSubview(self.cardView)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.cardView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
        self.imagesView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(102 + 66 + 66)
            
        }
        
        self.tariff1.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.height.equalTo(88)
        }
        
        self.tariff3.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.height.equalTo(88)
        }
        
        self.tariff2.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.center.equalToSuperview()
            make.width.height.equalTo(102)
        }
        
        self.titleLabel.snp.updateConstraints { make in
            make.top.equalTo(self.imagesView.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        self.subtitleLabel.snp.updateConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        self.seeButton.snp.updateConstraints { make in
            make.top.equalTo(self.subtitleLabel.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.height.equalTo(56)
        }
        
    }
    
    @objc func goToTariffTab() {
        delegate?.goToTariffTab()
    }
}
