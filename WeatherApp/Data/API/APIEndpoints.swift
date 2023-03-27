//
//  APIEndpoints.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation

struct APIEndpoints {
    
    static func currentWeather(for coordinate: Coordinate) -> Endpoint {
        return Endpoint(path: "weather",
                        method: .get,
                        queryParametersEncodable: coordinate)
    }
    
    static func forecast(for coordinate: Coordinate) -> Endpoint {
        return Endpoint(path: "forecast",
                        method: .get,
                        queryParametersEncodable: coordinate)
    }
    
    static func geocoding(for query: String) -> Endpoint {
        return Endpoint(path: "http://api.openweathermap.org/geo/1.0/direct",
                        isFullPath: true,
                        method: .get,
                        queryParameters: ["q" : query, "limit" : 1])
    }
}
