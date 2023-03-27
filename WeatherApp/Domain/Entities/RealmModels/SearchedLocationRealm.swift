//
//  SearchedLocation.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import RealmSwift

class SearchedLocationRealm: Object {
    @objc dynamic var id = UUID()
    @objc dynamic var name = ""
    @objc dynamic var latitude = 0.0
    @objc dynamic var longitude = 0.0
    
    override init() {
        
    }
    
    init(id: UUID = UUID(), name: String = "", latitude: Double = 0.0, longitude: Double = 0.0) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
