//
//  GeocodingResponse.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation

struct GeocodingResponse: Codable {
    var name: String?
    var country: String?
    var latitude: Double?
    var longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat", longitude = "lon"
        case name, country
    }
}
