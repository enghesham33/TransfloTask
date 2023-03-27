//
//  WeatherDataRealm.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import RealmSwift

class WeatherDataRealm: Object {
    @objc dynamic var id = UUID()
    @objc dynamic var date: Int = 0
    
    // coordinate
    @objc dynamic var latitutde: Double = 0.0
    @objc dynamic var longitude: Double = 0.0
    
    //main
    @objc dynamic var temprature: Double = 0.0
    @objc dynamic var feelsLike: Double = 0.0
    @objc dynamic var minimumTemprature: Double = 0.0
    @objc dynamic var maximumTemprature: Double = 0.0
    @objc dynamic var pressure: Int = 0
    @objc dynamic var seaLevel: Int = 0
    @objc dynamic var groundLevel: Int = 0
    @objc dynamic var humidity: Int = 0
    @objc dynamic var temparatureKF: Double = 0.0
    
    //weather
    @objc dynamic var main: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var icon: String = ""
    
    //clouds
    @objc dynamic var all: Int = 0
    
    //wind
    @objc dynamic var speed: Double = 0.0
    @objc dynamic var degree: Int = 0
    @objc dynamic var gust: Double = 0.0
    
    //rain
    @objc dynamic var h1: Double = 0.0
    @objc dynamic var h2: Double = 0.0
    @objc dynamic var h3: Double = 0.0
}
