//
//  Helper.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import FittedSheets
import DropDown
import UIKit

class Helper {
    
    class func createSheetController(vc: UIViewController, sizes: [SheetSize] = []) -> SheetViewController {
        let options = SheetOptions(
            // The full height of the pull bar. The presented view controller will treat this area as a safearea inset on the top
            pullBarHeight: 24,
            
            // The corner radius of the shrunken presenting view controller
            presentingViewCornerRadius: 20,
            
            // Extends the background behind the pull bar or not
            shouldExtendBackground: true,
            
            // Attempts to use intrinsic heights on navigation controllers. This does not work well in combination with keyboards without your code handling it.
            setIntrinsicHeightOnNavigationControllers: true,
            
            // Pulls the view controller behind the safe area top, especially useful when embedding navigation controllers
            useFullScreenMode: true,
            
            // Shrinks the presenting view controller, similar to the native modal
            shrinkPresentingViewController: false,
            
            // Determines if using inline mode or not
            useInlineMode: false
        )
        return SheetViewController(controller: vc, sizes: sizes, options: options)
    }
    
    class func convertTimeStampToString(timeStamp: Double, format: String) -> String {
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    class func convertTimeStampToDate(timeStamp: Double, format: String) -> Date {
        return Date(timeIntervalSince1970: timeStamp)
    }
}
