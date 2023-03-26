//
//  UIColor+Extensions.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import UIKit

extension UIColor {
    
    class func backgroundColor() -> UIColor {
        guard let color = UIColor(named: "BackgroundColor") else {
            return  #colorLiteral(red: 0.9530000091, green: 0.9530000091, blue: 0.976000011, alpha: 1)
        }
        return color
    }
    
    class func blackColor() -> UIColor {
        guard let color = UIColor(named: "BlackColor") else {
            return  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        return color
    }
    
    public class func primaryColor() -> UIColor {
        guard let color = UIColor(named: "Primary") else {
            return  #colorLiteral(red: 0, green: 0.3729999959, blue: 0.753000021, alpha: 1)
        }
        return color
    }
    
    class func whiteColor() -> UIColor {
        guard let color = UIColor(named: "WhiteColor") else {
            return  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        return color
    }
    
    class func greyishBrownColor() -> UIColor {
        guard let color = UIColor(named: "greyishBrown") else {
            return  #colorLiteral(red: 0.2549019608, green: 0.2549999952, blue: 0.2549999952, alpha: 1)
        }
        return color
    }
    
    class func secondaryColor() -> UIColor {
        guard let color = UIColor(named: "Secondary") else {
            return  #colorLiteral(red: 0.4666666667, green: 0.8901960784, blue: 0.7058823529, alpha: 1)
        }
        return color
    }
    
    class func paleGrey() -> UIColor {
        guard let color = UIColor(named: "PaleGrey") else {
            return  #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9764705882, alpha: 1)
        }
        return color
    }
}
