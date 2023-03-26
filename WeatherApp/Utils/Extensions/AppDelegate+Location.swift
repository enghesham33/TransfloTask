//
//  AppDelegate+Location.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import UIKit
import CoreLocation

extension AppDelegate: CLLocationManagerDelegate {
        
    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager?.startUpdatingLocation()
    }
    
    // Below method will provide you current location.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.last != nil {
            locationManager?.stopMonitoringSignificantLocationChanges()
            if let locationValue: CLLocationCoordinate2D = manager.location?.coordinate {
                UD.currentLatitude = locationValue.latitude
                UD.currentLongitude = locationValue.longitude
                NotificationCenter.default.post(name: .newLocationSaved, object: nil)
                locationManager?.stopUpdatingLocation()
            }
        }
    }

    // Below Mehtod will print error if not able to update location.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error")
    }
    
    // Below Mehtod will show dialog to enable location settings in device Settings if no permission provided.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        switch status {
        case .authorizedAlways:
          locationManager?.requestLocation()
          break
            
        case .authorizedWhenInUse:
          locationManager?.requestLocation()
          break
            
        case .denied, .restricted:
            let alertController = UIAlertController(title: "OPPS", message: "Please go to Settings to enable location permission", preferredStyle: .alert)
            let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in })
                 }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .default) {_ -> Void in}
            
            alertController.addAction(cancelAction)
            alertController.addAction(settingsAction)
            SceneDelegate.window?.rootViewController?.present(alertController, animated: true, completion: nil)
          break
            
        case .notDetermined:
          locationManager?.requestWhenInUseAuthorization()
          break
            
        default:
            break
        }
    }
}

extension Notification.Name {
    static let newLocationSaved = Notification.Name("newLocationSaved")
}
