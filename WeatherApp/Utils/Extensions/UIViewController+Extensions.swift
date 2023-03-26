//
//  UIViewController+Extensions.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIViewController {
    
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
    
    func startLoading() {
        self.view.isUserInteractionEnabled = false
        ActivityIndicatorHelper.start()
    }
    func stopLoading() {
        ActivityIndicatorHelper.end()
        self.view.isUserInteractionEnabled = true
    }
}

extension UIViewController: NavigationRoute {
    
    func setRootController(with route: Route) {
        let nav = getCurrentNavigation()
        nav?.viewControllers = [route.destination]
    }
    
    func getCurrentNavigation() -> UINavigationController? {
        if type(of: self) == UINavigationController.self {
            return (self as? UINavigationController)
        } else if self.presentingViewController is UINavigationController {
            return (self.presentingViewController as? UINavigationController)
        } else {
            return self.navigationController
        }
    }
    
    func popViewController() {
        let nav = getCurrentNavigation()
        nav?.popViewController(animated: true)
    }
    
    func navigate(to route: Route) {
        switch route.style {
        case .modal(let transtion):
            self.presentViewController(route.destination, transtion ?? .coverVertical)
        case .push:
            let nav = getCurrentNavigation()
            nav?.pushViewController(route.destination, animated: true)
            nav?.interactivePopGestureRecognizer?.delegate = self
        case .BottomSheet(let size):
            let nav = getCurrentNavigation()
            nav?.present(Helper.createSheetController(vc: route.destination, sizes: size ?? []), animated: true)
         }
    }
    
    func dismiss(navigateTo route: Route? = nil) {
        self.dismiss(animated: true)
        guard let route = route else {return}
        navigate(to: route)
    }
    
    func presentViewController(_ viewController : UIViewController, _ defaultTranstion: UIModalTransitionStyle = .coverVertical) {
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = defaultTranstion
        self.present(viewController, animated: true, completion: nil)
    }
}

extension UIViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer.isEqual(navigationController?.interactivePopGestureRecognizer) {
            navigationController?.popViewController(animated: true)
            return false
        }
        return true
    }
}
