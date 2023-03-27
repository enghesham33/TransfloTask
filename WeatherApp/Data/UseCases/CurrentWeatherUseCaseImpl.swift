//
//  CurrentWeatherUseCaseImpl.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import RxSwift

class CurrentWeatherUseCaseImpl: CurrentWeatherUseCase {
    
    private let repository : CurrentWeatherRepository
    
    init(repository: CurrentWeatherRepository) {
        self.repository = repository
    }
    
    func getCurrentWeatherData(for coordinate: Coordinate) -> Observable<Result<WeatherResponse>> {
        return Observable<Result<WeatherResponse>>.create { observer in
            observer.onNext(Result.loading)
            self.repository.getCurrentWeatherData(for: coordinate) { result in
                observer.onNext(result)
            }
            return Disposables.create()
        }
    }
    
    func getLatestSearchedLocation() -> Observable<Result<SearchedLocationRealm?>> {
        return Observable<Result<SearchedLocationRealm?>>.create { observer in
            observer.onNext(Result.loading)
            self.repository.getLatestSearchedLocation() { result in
                observer.onNext(result)
            }
            return Disposables.create()
        }
    }
    
    func saveSearchedLocation(location: SearchedLocationRealm) -> Observable<Result<Bool>> {
        return Observable<Result<Bool>>.create { observer in
            observer.onNext(Result.loading)
            self.repository.saveSearchedLocation(location: location) { result in
                observer.onNext(result)
            }
            return Disposables.create()
        }
    }
}
