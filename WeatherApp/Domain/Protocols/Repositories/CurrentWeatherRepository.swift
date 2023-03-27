//
//  CurrentWeatherRepository.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation

protocol CurrentWeatherRepository {
    func getCurrentWeatherData(for coordinate: Coordinate, completion: @escaping(Result<WeatherResponse>) -> Void)
    func getLatestSearchedLocation(completion: @escaping(Result<SearchedLocationRealm?>) -> Void)
    func saveSearchedLocation(location: SearchedLocationRealm, completion: @escaping(Result<Bool>) -> Void)
}
