//
//  UIColor.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/17/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit
extension UIColor {
    /**
     Application main theme text color
     */
    class var  mainText: UIColor {
        return  UIColor(named: "mainText") ?? #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    }
    
    class var  loaderTransparent: UIColor {
        return UIColor(named: "loaderTransparent") ?? #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 0.5)
    }
    
    /**
     Application main theme highlighed text color
     */
    class var  highlightedRed: UIColor {
        return UIColor(named: "highlightedRed") ?? #colorLiteral(red: 0.7803921569, green: 0.3098039216, blue: 0.4392156863, alpha: 1)
    }
    
}
