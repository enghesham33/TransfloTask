//
//  CurrentWeatherRepositoryImpl.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation

class CurrentWeatherRepositoryImpl: BaseRepository, CurrentWeatherRepository {
    
    func getCurrentWeatherData(for coordinate: Coordinate, completion: @escaping (Result<WeatherResponse>) -> Void) {
        let endPoint = APIEndpoints.currentWeather(for: coordinate)
        do {
            let (urlRequest, parameters) = try endPoint.urlRequest(with: config)
            remoteDataSource.sendRequest(urlRequest, param: parameters) { (result: Result<Data>) in
                switch result {
                case .success(let data):
                    let currentWeatherResponse = try! JSONDecoder().decode(WeatherResponse.self, from: data)
                    completion(.success(data: currentWeatherResponse))
                    break
                case .failure(let error, let code):
                    completion(.failure(error,  code: code))
                case .loading:
                    completion(.loading)
                }
            }
        } catch {
            completion(.failure(AppError(reason: .urlGeneration, message: "check your url"), code: 0))
        }
    }
    
    func getLatestSearchedLocation(completion: @escaping(Result<SearchedLocationRealm?>) -> Void) {
        let locations = RealmManager.sharedInstance.getAllDataForObject(SearchedLocationRealm.self).map{$0 as! SearchedLocationRealm}
        completion(.success(data: locations.first))
    }
    
    func saveSearchedLocation(location: SearchedLocationRealm, completion: @escaping(Result<Bool>) -> Void) {
        RealmManager.sharedInstance.add([location]) {
            completion(.success(data: true))
        }
    }
}
