//
//  ActivityIndicator.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import SnapKit
import RxSwift
import RxCocoa

class ActivityIndicatorHelper {
    
    static var container: UIView = UIView()
    static var loadingView: UIView = UIView()
    static var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    static func start() {
        guard let view = UIApplication.shared.windows.first?.rootViewController?.view else {return}
        container.frame = view.frame
        container.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        container.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .white
        view.addSubview(container)
        container.snp.makeConstraints() {
            make in
            make.center.equalTo(view.snp.center)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.height)
        }
        
        
        loadingView.frame = CGRect(x:0, y:0, width:80, height:80)
        loadingView.backgroundColor = UIColor.clear
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        container.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        loadingView.snp.makeConstraints() {
            make in
            make.center.equalTo(container.snp.center)
            make.width.height.equalTo(80)
        }
        
        activityIndicator.frame = CGRect(x:0.0, y:0.0, width:40.0, height:40.0);
        if #available(iOS 13.0, *) {
            activityIndicator.style = UIActivityIndicatorView.Style.large
        } else {
            activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        }
        activityIndicator.center = CGPoint(x:loadingView.frame.size.width / 2, y:loadingView.frame.size.height / 2);
        
        loadingView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    /*
     *Hide activity indicator
     *remove activity indicator from its super view
     */
    
    static func end() {
        activityIndicator.backgroundColor = .clear
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
}
