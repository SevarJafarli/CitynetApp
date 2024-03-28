//
//  AdditionalServiceType.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 28.03.24.
//

import UIKit


internal struct AdditionalServiceType {
    let type: ServiceType
    let price: String

}

internal enum ServiceType {
    case staticIP
    case additionalTVBox
    
    var title: String {
        switch self {
        case .staticIP:
            "Statik IP"
        case .additionalTVBox:
            "Əlavə TV Box cihazı"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .staticIP:
            AppAssets.ip.load()
        case .additionalTVBox:
            AppAssets.tvbox.load()
        }
    }
    
    var subtitle: String {
        switch self {
        case .staticIP:
            "Müşahidə kameraları, şəbəkə oyunları, fayl mübadiləsi və bir çox yöndə istifadə edilir."
        case .additionalTVBox:
            "Əlavə TV Box cihazı alaraq, birdən çox televizora paylaya bilərsən."
        }
    }
    
}
