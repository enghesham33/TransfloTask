//
//  GeocodingUseCaseImpl.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import RxSwift

class GeocodingUseCaseImpl: GeocodingUseCase {
    
    private let repository : GeocodingRepository
    
    init(repository: GeocodingRepository) {
        self.repository = repository
    }
    
    func getGeocodingData(query: String) -> Observable<Result<[GeocodingResponse]>> {
        return Observable<Result<[GeocodingResponse]>>.create { observer in
            observer.onNext(Result.loading)
            self.repository.getGeocodingData(query: query) { result in
                observer.onNext(result)
            }
            return Disposables.create()
        }
    }
}
