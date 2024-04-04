//
//  ViewController+Ext.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 04.04.24.
//

import UIKit

extension UIViewController {
    func hideNavigationBar(animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func showNavigationBar(animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
