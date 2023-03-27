//
//  GeocodingRepository.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation

protocol GeocodingRepository {
    func getGeocodingData(query: String, completion: @escaping(Result<[GeocodingResponse]>) -> Void)
}
