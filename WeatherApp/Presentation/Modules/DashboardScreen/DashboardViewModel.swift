//
//  DashboardViewModel.swift
//  WeatherApp
//
//  Created by Hesham Donia on 27/03/2023.
//

import RxSwift

final class DashboardViewModel: BaseViewModel {
    
    private let useCase: CurrentWeatherUseCase
    
    var weatherResponseSubject: PublishSubject<WeatherResponse> = PublishSubject<WeatherResponse>()
        
    init(useCase: CurrentWeatherUseCase) {
        self.useCase = useCase
    }
    
    func getCurrentWeatherInfoForLastSearchedLocation() {
        let latestLocationObservable = useCase.getLatestSearchedLocation()
        latestLocationObservable.subscribe(onNext: { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let searchedLocation):
                if let location = searchedLocation {
                    self.getCurrentWeatherData(coordinate: Coordinate(latitude: location.latitude, longitude: location.longitude))
                } else {
                    AppDelegate.instance.setupLocationManager()
                    NotificationCenter.default.addObserver(self, selector: #selector(self.newLocationSaved), name: .newLocationSaved, object: nil)
                }
                self.changeLoadingState(isLoading: false)
                break
                
            case .failure(let error, _):
                self.changeLoadingState(isLoading: false)
                self.handleError(error: error?.localizedDescription ?? "")
                break
                
            case .loading:
                self.changeLoadingState(isLoading: true)
                break
                
            }
        }).disposed(by: self.disposeBag)
    }
    
    @objc func newLocationSaved() {
        getCurrentWeatherData(coordinate: Coordinate(latitude: UD.currentLatitude, longitude: UD.currentLongitude))
    }
    
    private func getCurrentWeatherData(coordinate: Coordinate) {
        let weatherDataObservable = self.useCase.getCurrentWeatherData(for: Coordinate(latitude: coordinate.latitude, longitude: coordinate.longitude))
        weatherDataObservable.subscribe(onNext: { [weak self] result in
                guard let self = self else {return}
                switch result {
                case .success(let weatherResponse):
                    self.weatherResponseSubject.on(.next(weatherResponse))
                    
                    self.saveSearchLocation(location: SearchedLocationRealm(name: weatherResponse.name ?? "", latitude: coordinate.latitude ?? 0.0, longitude: coordinate.longitude ?? 0.0))
                    self.changeLoadingState(isLoading: false)
                    break
                    
                case .failure(let error, _):
                    self.changeLoadingState(isLoading: false)
                    self.handleError(error: error?.localizedDescription ?? "")
                    break
                    
                case .loading:
                    self.changeLoadingState(isLoading: true)
                    break
                    
                }
            }).disposed(by: self.disposeBag)
    }
    
    private func saveSearchLocation(location: SearchedLocationRealm) {
        let saveLocationObservable = self.useCase.saveSearchedLocation(location: location)
        saveLocationObservable.subscribe(onNext: { [weak self] result in
                guard let self = self else {return}
                switch result {
                case .success(_):
                    self.changeLoadingState(isLoading: false)
                    break
                    
                case .failure(let error, _):
                    self.changeLoadingState(isLoading: false)
                    self.handleError(error: error?.localizedDescription ?? "")
                    break
                    
                case .loading:
                    self.changeLoadingState(isLoading: true)
                    break
                    
                }
            }).disposed(by: self.disposeBag)
    }
    
}
