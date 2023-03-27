//
//  ForecastRepository.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation

protocol ForecastRepository {
    func getForecastData(for coordinate: Coordinate, completion: @escaping(Result<ForecastResponse>) -> Void)
}
