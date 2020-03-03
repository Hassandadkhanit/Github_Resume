//
//  UIScrollView.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/22/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

extension UIScrollView {

    /**
     Will adjest scrollView contentView and add pading when keyboard is visible.
     - parameter open: is keyboard open.
     - parameter notification: keyboard open and close notification.

     - returns: void.
     */
    public func adjustKeyboardShow(_ open: Bool, notification: Notification) {
        if let userInfo = notification.userInfo,
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = (keyboardFrame.height + 8) * (open ? 1 : -1)
            self.contentInset.bottom += keyboardHeight
            self.scrollIndicatorInsets.bottom += keyboardHeight
        }
    }
}
