//
//  UITableViewHeaderFooterView.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/24/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

extension UITableViewHeaderFooterView {
    /**
     Register Header/Footer View with UITableView.

     - parameter tableView: UITableView to register Header/Footer View with.

     - returns: void.
     */
    class public func registerReusableHeaderView(with tableView :UITableView?) {
        tableView?.register(UINib(nibName: self.viewIdentifier(), bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: self.viewIdentifier())
    }

    /**
     Will return class name as string.
     - returns: name of 'self' as string.
     */
    class public func viewIdentifier() -> String {
        return String(describing: self)
    }
}
