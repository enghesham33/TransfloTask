//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation

struct WeatherResponse: Codable {
    var coordinate: Coordinate?
    var weather: [Weather]?
    var base: String?
    var main: Main?
    var visibility: Int?
    var wind: Wind?
    var rain: Rain?
    var clouds: Clouds?
    var date: Int?
    var timezone: Int?
    var id: Int?
    var name: String?
    var code: Int?
    
    enum CodingKeys: String, CodingKey {
        case coordinate = "coord", weather, base, main, visibility, wind, rain, clouds, date = "dt", timezone, id, name, code = "cod"
    }
}

struct Coordinate: Codable {
    var latitude: Double?
    var longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat", longitude = "lon"
    }
}
