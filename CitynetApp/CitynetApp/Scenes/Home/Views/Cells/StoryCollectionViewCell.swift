//
//  StoryCollectionViewCell.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 29.03.24.
//

import UIKit
import CitynetUIKit

class StoryCollectionViewCell: UICollectionViewCell {

    private lazy var cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.borderColor = adaptiveColor(.deepCarmine500).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = AppFonts.SFCaption1Medium.fontStyle
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    

    
    private func addSubviews() {
        self.contentView.addSubview(self.cardView)
        self.cardView.addSubview(self.imageView)
        self.cardView.addSubview(self.titleLabel)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.cardView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.imageView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(3)
        }
        
        self.titleLabel.snp.updateConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    public func configure(image: UIImage?, title: String) {
        self.imageView.image = image
        self.titleLabel.text = title
    }
}
