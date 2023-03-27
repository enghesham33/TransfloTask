//
//  DashboardViewController.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import UIKit

class DashboardViewController: BaseViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tempratureLabel: UILabel!
    @IBOutlet weak var maxMinTempratureLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var lastUpdateLabel: UILabel!
    
    var viewModel: DashboardViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = AppDelegate.container.resolve(DashboardViewModel.self)
        viewModel.getCurrentWeatherInfoForLastSearchedLocation()
        viewModel.loading.subscribe { [weak self] isLoading in
            if isLoading.element ?? false {
                self?.startLoading()
            } else {
                self?.stopLoading()
            }
        }.disposed(by: self.disposeBag)
        
        viewModel.error.subscribe { [weak self] error in
            if let error = error.element, !error.isEmpty {
                self?.showErrorMessage(message: error)
            }
        }.disposed(by: self.disposeBag)
        
        viewModel.weatherResponseSubject.subscribe { [weak self] weatherResponse in
            self?.nameLabel.text = weatherResponse.element?.name
            
            self?.tempratureLabel.text = "Temprature: \(Int((weatherResponse.element?.main?.temprature ?? 0.0)) - 273)C and feels like: \((Int(weatherResponse.element?.main?.feelsLike ?? 0.0)) - 273)C"
            
            self?.maxMinTempratureLabel.text = "Maximum Temprature: \(Int((weatherResponse.element?.main?.maximumTemprature ?? 0.0)) - 273)C \n\nMinimum Temprature: \((Int(weatherResponse.element?.main?.minimumTemprature ?? 0.0)) - 273)C"
            
            self?.pressureLabel.text = "Pressure: \(weatherResponse.element?.main?.pressure ?? 0) hPa"
            
            self?.windSpeedLabel.text = "Wind Speed: \(weatherResponse.element?.wind?.speed ?? 0.0) meter/sec"
            
        }.disposed(by: self.disposeBag)
        
    }
    
    
    @IBAction func goToForecastButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func goToCurrentWeatherButtonPressed(_ sender: Any) {
        
    }
}
