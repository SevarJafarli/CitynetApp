//
//  Result.swift
//  CitynetNetworkKit
//
//  Created by Sevar Jafarli on 19.03.24.
//

import Foundation


public enum Result<SuccessValue, WrongValue> {
    case successNoContent
    case success(SuccessValue)
    case wrong(WrongValue)
    case failure(Error)
}
