//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import UIKit
import RxSwift
import Toast_Swift

class BaseViewController: UIViewController {
        
    let disposeBag = DisposeBag()
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setStatusBar(backgroundColor: UIColor.backgroundColor())
        UIApplication.shared.statusBarStyle = .darkContent
    }
    
    func showErrorMessage(message: String?) {
        self.view.makeToast(message)
    }
    
}
