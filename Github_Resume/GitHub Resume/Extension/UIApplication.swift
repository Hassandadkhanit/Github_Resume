//
//  UIApplication.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/18/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

extension UIApplication {

    /**
     The app's key window taking into consideration apps that support multiple scenes.
     */
    var keyWindowInConnectedScenes: UIWindow? {
        return windows.first(where: { $0.isKeyWindow })
    }

}
