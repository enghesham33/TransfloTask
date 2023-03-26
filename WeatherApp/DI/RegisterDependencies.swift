//
//  RegisterDependencies.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import Swinject

extension Container {
    func registerDependencies() {
        registerViewModels()
        registerRepositories()
        registerUseCases()
    }
}
