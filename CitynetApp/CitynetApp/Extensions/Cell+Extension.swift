//
//  Cell+Extension.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 28.03.24.
//

import UIKit

public protocol CellConfigurer: AnyObject {
    static var reuseIdentifier: String {get}
}

public extension CellConfigurer {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: CellConfigurer { }
extension UITableViewCell: CellConfigurer { }


extension UITableViewCell {
    func setupCell(with color: UIColor? = nil) {
        self.contentView.backgroundColor = color ?? adaptiveColor(.whiteBg)
        self.selectionStyle = .none
    }
}
