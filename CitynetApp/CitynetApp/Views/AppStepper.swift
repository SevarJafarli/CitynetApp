//
//  AppStepper.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 28.03.24.
//

import UIKit

class AppStepper: UIControl {
    
    private lazy var plusButton = stepperButton( image: AppAssets.plus.load() , value: 1)
    private lazy var minusButton = stepperButton(image: AppAssets.minus.load(), value: -1)
    
    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "0"
        return label
    }()
    
    private lazy var container: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    struct ViewData {
        let minimum: Double
        let maximum: Double
        let stepValue: Double
    }
    
    private (set) var value: Double = 0
    private let viewData: ViewData
    
    init(viewData: ViewData) {
        self.viewData = viewData
        super.init(frame: .zero)
        if value == viewData.minimum {
            minusButton.tintColor = adaptiveColor(.borderColor)
        }
        setup()
        
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setValue(_ newValue: Double) {
        updateValue(min(viewData.maximum, max(viewData.minimum, newValue)))
    }
    
    private func setup() {
        container.layer.cornerRadius = 12
        container.layer.borderWidth = 1
        container.layer.borderColor = adaptiveColor(.borderColor).cgColor
        addSubview(container)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        [minusButton, counterLabel, plusButton].forEach(container.addArrangedSubview)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        plusButton.layer.cornerRadius = 0.5 * bounds.size.height
        minusButton.layer.cornerRadius = 0.5 * bounds.size.height
    }
    
    private func didPressedStepper(value: Double) {
        updateValue(value * viewData.stepValue)
    }
    
    private func updateValue(_ newValue: Double) {
        
        guard (viewData.minimum...viewData.maximum) ~= (value + newValue) else {
            return
        }
        
        value += newValue
        
        counterLabel.text = String(value.formatted())
        if value == viewData.minimum {
            minusButton.tintColor = adaptiveColor(.borderColor)
        }
        else {
            minusButton.tintColor = adaptiveColor(.charcoalGrey02)
        }
        if value == viewData.maximum {
            plusButton.tintColor = adaptiveColor(.borderColor)
        }
        else {
            plusButton.tintColor = adaptiveColor(.charcoalGrey02)
        }
        sendActions(for: .valueChanged)
    }
    
    private func stepperButton(image: UIImage?, value: Int) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.setImage(image, for: .normal)
        button.tag = value
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.tintColor = adaptiveColor(.charcoalGrey02)
        return button
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        didPressedStepper(value: Double(sender.tag))
    }
}
