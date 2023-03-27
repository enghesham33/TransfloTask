//
//  ForecastUseCaseImpl.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import RxSwift

class ForecastUseCaseImpl: ForecastUseCase {
    
    private let repository : ForecastRepository
    
    init(repository: ForecastRepository) {
        self.repository = repository
    }
    
    func getForecastData(for coordinate: Coordinate) -> Observable<Result<ForecastResponse>> {
        return Observable<Result<ForecastResponse>>.create { observer in
            observer.onNext(Result.loading)
            self.repository.getForecastData(for: coordinate) { result in
                observer.onNext(result)
            }
            return Disposables.create()
        }
    }
}
