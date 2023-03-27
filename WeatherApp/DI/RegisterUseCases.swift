//
//  RegisterUseCases.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    
    func registerUseCases() {
        autoregister(ForecastUseCase.self, initializer: ForecastUseCaseImpl.init)
        autoregister(CurrentWeatherUseCase.self, initializer: CurrentWeatherUseCaseImpl.init)
        autoregister(GeocodingUseCase.self, initializer: GeocodingUseCaseImpl.init)

    }
}
