//
//  NetworkConfig.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation

public struct ApiDataNetworkConfig {
    public let baseURL: URL
    public let apiKey: String
    
    public init() {
        self.baseURL =  URL(string: "https://api.openweathermap.org/data/2.5/forecast")!
        self.apiKey = "ae3168e67930a9e6e43cf4493e961348"
    }
}
