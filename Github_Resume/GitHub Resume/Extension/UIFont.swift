//
//  UIFont.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/17/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

extension UIFont {

    /**
     Returns a application font with custom size.

     - parameter ofSize: Font size.

     - returns: UIFont.
     */
    class func appFont(ofSize size: Float) -> UIFont {
        return UIFont(name: "GillSans", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
    }

    /**
     Returns a application Semi-Bold font with custom size.

     - parameter ofSize: Font size.

     - returns: UIFont.
     */
    class func appSemiBoldFont(ofSize size: Float) -> UIFont {
        return UIFont(name: "GillSans-SemiBold", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size), weight: UIFont.Weight.bold)
    }

    /**
     Returns a application Bold font with custom size.

     - parameter ofSize: Font size.

     - returns: UIFont.
     */
    class func appBoldFont(ofSize size: Float) -> UIFont {
        return UIFont(name: "GillSans-Bold", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size), weight: UIFont.Weight.bold)
    }

    class func printAllFonts() {
        for family in UIFont.familyNames {
            print("Font family Name: \(family)")
            print("-------------------------------")

            for name in UIFont.fontNames(forFamilyName: family) {
                print("   \(name)")
            }
            print("-------------------------------")
        }
    }
}


//MARK:- Application basic fonts.
extension UIFont {

    class var mainTitle: UIFont {
        return UIFont.appFont(ofSize: 22.0)
    }
    
    class var title: UIFont {
        return UIFont.appFont(ofSize: 16.0)
    }

    class var body: UIFont {
        return UIFont.appFont(ofSize: 14.0)
    }
}
