//
//  RegisterRepositories.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension Container {
    func registerRepositories() {
        autoregister(RemoteDataSource.self, initializer: RemoteDataSource.init)
        autoregister(ApiDataNetworkConfig.self, initializer: ApiDataNetworkConfig.init)
        autoregister(ForecastRepository.self, initializer: ForecastRepositoryImpl.init)
        autoregister(CurrentWeatherRepository.self, initializer: CurrentWeatherRepositoryImpl.init)
        autoregister(GeocodingRepository.self, initializer: GeocodingRepositoryImpl.init)
    }
}
