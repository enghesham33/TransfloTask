//
//  GeocodingUseCase.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import RxSwift

protocol GeocodingUseCase {
    func getGeocodingData(query: String) -> Observable<Result<[GeocodingResponse]>>
}
