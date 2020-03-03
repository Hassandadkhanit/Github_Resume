//
//  Error.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/17/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

extension NSError {
    
    /**
     Show server error inside UIViewController.
     
     - parameter viewController: View controller in which you want to show error.
     
     - returns: void.
     */
    func showServerErrorInViewController(_ viewController: UIViewController,
                                         _ actionBlock: @escaping OKButtonCompletionHandler = {}) {
        
        if (viewController.isViewLoaded && (viewController.view.window != nil)) {
            viewController.showAlert(title: TitleMessageConstants.error, message: localizedDescription, btnTitle: TitleMessageConstants.OK, actionBlock)
        }
    }
}
