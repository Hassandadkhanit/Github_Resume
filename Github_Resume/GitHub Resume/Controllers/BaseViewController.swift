//
//  BaseViewController.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/25/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    //MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
