//
//  ForecastResponse.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation

struct ForecastResponse: Codable {
    
    var code: String?
    var message: Int?
    var cnt: Int?
    var list: [ForecastItem]?
    
    enum CodingKeys: String, CodingKey {
        case code = "cod"
        case message, cnt, list
    }
}

struct ForecastItem: Codable {
    var date: Int?
    var main: Main?
    var weather: Weather?
    var clouds: Clouds?
    var wind: Wind?
    var rain: Rain?
    var visibility: Int?
    var pop: Double?
    var dateText: String?
    
    enum CodingKeys: String, CodingKey {
        case date = "dt", dateText = "dt_txt"
        case main, weather, clouds, wind, rain, visibility, pop
    }
}

struct Main: Codable {
    var temprature: Double?
    var feelsLike: Double?
    var minimumTemprature: Double?
    var maximumTemprature: Double?
    var pressure: Int?
    var seaLevel: Int?
    var groundLevel: Int?
    var humidity: Int?
    var temparatureKF: Double?
    
    enum CodingKeys: String, CodingKey {
        case temprature = "temp", feelsLike = "feels_like", minimumTemprature = "temp_min", maximumTemprature = "temp_max", seaLevel = "sea_level", groundLevel = "grnd_level", temparatureKF = "temp_kf"
        case pressure, humidity
    }
}

struct Weather: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct Clouds: Codable {
    var all: Int?
}

struct Wind: Codable {
    var speed: Double?
    var degree: Int?
    var gust: Double?
    
    enum CodingKeys: String, CodingKey {
        case degree = "deg"
        case speed, gust
    }
}

struct Rain: Codable {
    var h1: Double?
    var h2: Double?
    var h3: Double?
    
    enum CodingKeys: String, CodingKey {
        case h1 = "1h", h2 = "2h", h3 = "3h"
    }
}
