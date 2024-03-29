//
//  HomePageModels.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 22.03.24.
//

import UIKit

enum HomePage {
    
    // MARK: Use cases
  
    enum Load {
        
        struct Request {
        }
        
        struct Response {
        }
        
        struct ViewModel {
        }
    }
}

//MARK: HomePageTableViewSections
internal enum Sections: CaseIterable {
    case stories
    case tariffBanner
    case allOperations
}
