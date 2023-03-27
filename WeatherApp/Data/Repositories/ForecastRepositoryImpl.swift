//
//  ForecastRepositoryImpl.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation

class ForecastRepositoryImpl: BaseRepository, ForecastRepository {
    
    func getForecastData(for coordinate: Coordinate, completion: @escaping (Result<ForecastResponse>) -> Void) {
        let endPoint = APIEndpoints.forecast(for: coordinate)
        do {
            let (urlRequest, parameters) = try endPoint.urlRequest(with: config)
            remoteDataSource.sendRequest(urlRequest, param: parameters) { (result: Result<Data>) in
                switch result {
                case .success(let data):
                    let forecastResponse = try! JSONDecoder().decode(ForecastResponse.self, from: data)
                    completion(.success(data: forecastResponse))
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
}
