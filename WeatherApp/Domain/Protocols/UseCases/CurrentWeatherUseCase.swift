//
//  CurrentWeatherUseCase.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import RxSwift

protocol CurrentWeatherUseCase {
    func getCurrentWeatherData(for coordinate: Coordinate) -> Observable<Result<WeatherResponse>>
    func getLatestSearchedLocation() -> Observable<Result<SearchedLocationRealm?>>
    func saveSearchedLocation(location: SearchedLocationRealm) -> Observable<Result<Bool>>
}
