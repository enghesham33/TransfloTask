//
//  AppResult.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation

enum Result<T> {
    
    case success(data: T)
    case failure(AppError?, code: Int)
    case loading
}
