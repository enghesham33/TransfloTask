//
//  Route.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import UIKit
import FittedSheets

protocol Route {
    var destination: UIViewController { get }
    var style: NaivgationStyle { get }
}

protocol NavigationRoute {
    func navigate(to route: Route)
    func dismiss(navigateTo route: Route?)
    func popViewController()
    func setRootController(with route: Route)
}

enum NaivgationStyle {
    case modal(transiton: UIModalTransitionStyle?)
    case push
    case BottomSheet(size: [SheetSize]?)
}
