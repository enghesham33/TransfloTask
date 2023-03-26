//
//  AppError.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
// MARK: - GetFailureReason
public struct AppError : Error , Equatable {
    var reason : GetFailureReason?
    var message : String?
    init(reason :GetFailureReason? , message : String? ) {
        self.reason = reason
        self.message = message
    }
}
enum GetFailureReason: Int, Error {
    case inValidPassword = 400
    case unAuthorized = 401
    case notFound = 404
    case serverError = 500
    case unprocessableEntity = 422
    case notModified = 304
    case networkError = 700
    case urlGeneration = 701
    case unKnownError = 702
     
    case NoInternetConnection = 0
    case reguestTimedout = 1001
}
