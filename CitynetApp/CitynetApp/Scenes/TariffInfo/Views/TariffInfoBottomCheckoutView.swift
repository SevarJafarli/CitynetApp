//
//  TariffInfoBottomCheckoutView.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 27.03.24.
//

import UIKit
import CitynetUIKit

internal final class TariffInfoBottomCheckoutView: UIView {
    
    private var checkoutStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 12
        return view
    }()
    
    private var checkoutTotalAmountStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .equalSpacing
        return view
    }()
    
    private lazy var totalLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Toplam"
        lbl.textColor = adaptiveColor(.charcoalGrey01)
        lbl.font = AppFonts.SFBodySemibold.fontStyle
        return lbl
    }()
    
    private lazy var totalAmountLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "32.99 ₼ / Aylıq"
        lbl.textColor = adaptiveColor(.charcoalGrey01)
        lbl.font = AppFonts.SFBodySemibold.fontStyle
        return lbl
    }()
    private var checkCartButton: AppPrimaryButton = {
        let btn = AppPrimaryButton()
        btn.setTitle("Sifarişə bax", for: .normal)
        return btn
    }()
    
    //MARK: INit
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        
        self.checkoutTotalAmountStackView.addArrangedSubview(self.totalLabel)
        self.checkoutTotalAmountStackView.addArrangedSubview(self.totalAmountLabel)
        self.checkoutStackView.addArrangedSubview(self.checkoutTotalAmountStackView)
        self.checkoutStackView.addArrangedSubview(self.checkCartButton)
        
        self.addSubview(self.checkoutStackView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.checkoutStackView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-34)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        self.checkCartButton.snp.updateConstraints { make in
            make.height.equalTo(56)
        }
    }
}
