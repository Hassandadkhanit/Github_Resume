//
//  CGRect.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/17/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

// MARK:- CGRect extension -
extension CGRect {
    
    /**
     CGRect x value.
     */
    var x: CGFloat {
        get {
            return self.origin.x
        }
        set {
            self.origin.x = newValue
        }
    }
    
    /**
     CGRect y value.
     */
    var y: CGFloat {
        get {
            return self.origin.y
        }
        set {
            self.origin.y = newValue
        }
    }
    
    /**
     CGRect center value.
     */
    var center: CGPoint {
        return CGPoint(x: self.x + self.width / 2, y: self.y + self.height / 2)
    }
}
