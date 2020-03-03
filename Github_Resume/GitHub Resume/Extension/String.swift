//
//  String.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/17/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

extension String {
    
    var trimmWhiteSpace: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /**
     Check if string contain sub string or not.
     
     - parameter subString: Substring to search in string.
     
     - returns: Substring existance status(Bool).
     */
    func containsSubString(_ subString: String?) -> Bool {
        
        let mainLowerString: String = self.lowercased()
        
        if let subString = subString {
            return mainLowerString.contains(subString.lowercased())
        }
        
        return false
    }
    
    /**
     Check if two string are equal or not.
     
     - parameter toString: string to compare with.
     - parameter ignorCase: ignorecase  Bool.
     
     - returns: Equal status(Bool).
     */
    func isEqual(_ toString: String?, ignorCase: Bool = false) -> Bool {
        
        // Check that if self is Empty
        if self.isEmpty || (toString?.isEmpty ?? true) {
            return false
        }
        
        let mainLowerString: String = ignorCase ? self.lowercased() : self
        
        if let otherString = toString {
            let otherLowerString = ignorCase ? otherString.lowercased() : otherString
            
            return mainLowerString == otherLowerString
            
        } else {
            return false
        }
    }
    
    /**
     Create and returns attributed text with custom color.
     
     - parameter mainStringColor: Complete text color.
     - parameter mainStringFont: Complete text font.
     - parameter highlightedStringColor: Highlighted text color.
     - parameter highlightedStringFont: Highlighted text font.
     - parameter highlighStrings: String array which need to be highlighted.
     
     - returns: NSMutableAttributedString.
     */
    func createAttributedString(mainStringColor: UIColor,
                                mainStringFont: UIFont,
                                highlightedStringColor: UIColor? = nil,
                                highlightedStringFont: UIFont? = nil,
                                highlighStrings: [String] = []) ->  NSMutableAttributedString {
        
        
        let newStr = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: mainStringFont, NSAttributedString.Key.foregroundColor: mainStringColor])
        
        
        for  text in highlighStrings {
            newStr.addAttribute(NSAttributedString.Key.font, value: highlightedStringFont ?? mainStringFont, range: (self as NSString).range(of: text))
            newStr.addAttribute(NSAttributedString.Key.foregroundColor, value: highlightedStringColor ?? mainStringColor, range: (self as NSString).range(of: text))
        }
        
        return newStr
    }
}
