//
//  Defaults.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import CoreLocation

// MARK: - ...  Defaults properties
internal class Defaults {
    struct Static {
        static var instance: Defaults?
    }
    
    @StoredDefaults(Constant.currentLatitude.rawValue)
    var currentLatitude: Double?
    
    @StoredDefaults(Constant.currentLongitude.rawValue)
    var currentLongitude: Double?
}

// MARK: - ...  UD for single object from Defaults proprties
internal var UD: Defaults {
    if Defaults.Static.instance == nil {
        Defaults.Static.instance = Defaults()
    }
    return Defaults.Static.instance!
}
