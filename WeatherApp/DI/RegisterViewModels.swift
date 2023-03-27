//
//  RegisterViewModels.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension Container {
    
    func registerViewModels() {
        autoregister(DashboardViewModel.self, initializer: DashboardViewModel.init)
    }
}
