//
//  BaseViewModel.swift
//  WeatherApp
//
//  Created by Hesham Donia on 27/03/2023.
//

import Foundation
import RxSwift

class BaseViewModel {
    let disposeBag = DisposeBag()
    
    var loading: PublishSubject<Bool> = PublishSubject<Bool>()
    
    var error: PublishSubject<String> = PublishSubject<String>()
    
    func changeLoadingState(isLoading: Bool) {
        self.loading.on(.next(isLoading))
    }
    
    func handleError(error: String) {
        self.error.on(.next(error))
    }
}
