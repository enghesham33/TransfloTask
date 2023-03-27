//
//  GeocodingRepositoryImpl.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation

class GeocodingRepositoryImpl: BaseRepository, GeocodingRepository {
    
    func getGeocodingData(query: String, completion: @escaping (Result<[GeocodingResponse]>) -> Void) {
        let endPoint = APIEndpoints.geocoding(for: query)
        do {
            let (urlRequest, parameters) = try endPoint.urlRequest(with: config)
            remoteDataSource.sendRequest(urlRequest, param: parameters) { (result: Result<Data>) in
                switch result {
                case .success(let data):
                    let geocodingResponse = try! JSONDecoder().decode([GeocodingResponse].self, from: data)
                    completion(.success(data: geocodingResponse))
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
