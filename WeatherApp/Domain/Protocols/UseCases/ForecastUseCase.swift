//
//  ForecastUseCase.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import RxSwift

protocol ForecastUseCase {
    func getForecastData(for coordinate: Coordinate) -> Observable<Result<ForecastResponse>>
}
