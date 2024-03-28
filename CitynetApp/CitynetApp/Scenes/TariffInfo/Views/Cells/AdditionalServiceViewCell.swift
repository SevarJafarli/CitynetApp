//
//  AdditionalServiceViewCell.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 28.03.24.
//

import UIKit
import CitynetUIKit

@objc protocol AdditionalServiceViewCellDelegate: AnyObject {
    @objc optional func onDeleteBtnTap()
    
    @objc optional func sendStepperValue(_ value: Double)
    
}
 
class AdditionalServiceViewCell: UITableViewCell, AdditionalServiceSingleViewDelegate {
    
    
    var serviceList: [AdditionalServiceType]? {
        didSet {
            configure()
        }
    }
    
    weak var delegate: AdditionalServiceViewCellDelegate?
    
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 24
        return view
    }()

    //MARK: Init
    
    fileprivate func setupCellBorder() {
        self.backgroundColor = .none
        self.contentView.layer.cornerRadius = 16
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = adaptiveColor(.borderColor).cgColor
        self.contentView.clipsToBounds = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell(with: .white)
        self.setupCellBorder()
        self.addSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {

        self.contentView.addSubview(self.stackView)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        self.stackView.snp.updateConstraints { make in
            make.verticalEdges.equalToSuperview().inset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
        }

        super.updateConstraints()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        stackView.arrangedSubviews.map { subview -> Void in
            stackView.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
    
    private func configure() {
       
        guard let serviceList = serviceList else { return }
        for (index, service) in serviceList.enumerated() {
            // Create and add a view
            let view = AdditionalServiceSingleView()
            view.model = service
            view.delegate = self
            self.stackView.addArrangedSubview(view)
            
            if index < serviceList.count - 1 {
                let divider = AppDivider()
                self.stackView.addArrangedSubview(divider)
            }
        }
    }
    
    func onDeleteBtnTap() {
        delegate?.onDeleteBtnTap?()
    }
    
    func sendStepperValue(_ value: Double) {
        delegate?.sendStepperValue?(value)
    }
}
