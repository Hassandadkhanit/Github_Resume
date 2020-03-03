//
//  UITableViewCell.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/24/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

extension UITableViewCell {
    /**
     Register cell with UITableView.

     - parameter tableView: UITableView to register Cell with.

     - returns: void.
     */
    class public func registerReusableCell(with tableView :UITableView?) {
        tableView?.register(UINib(nibName: self.cellIdentifier(), bundle: Bundle.main), forCellReuseIdentifier: self.cellIdentifier())
    }

    /**
     Will return class name as string.
     - returns: name of 'self' as string.
     */
    class public func cellIdentifier() -> String {
        return String(describing: self)
    }
}
