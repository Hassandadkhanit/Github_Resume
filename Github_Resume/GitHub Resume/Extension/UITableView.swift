//
//  UITableView.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/24/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

extension UITableView {

    /** Hides Default Sperator of UITableView */
    func hideDefaultSeprator() {
        self.separatorColor = UIColor.clear
        self.separatorStyle = .none
    }

    /** Deque cell of a UITableView */
    func dequeueReusableCell<T: UITableViewCell>() -> T? {
        return dequeueReusableCell(forIndexPath: nil)
    }

    /**
     Deque cell of a UITableView for index path.

     - parameter forIndexPath: Index path for dequing cell.

     - returns: void.
     */
    public func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath?) -> T? {

        if let myCell: T = self.dequeueReusableCell(indexPath) {
            return myCell

        } else {

            self.register(UINib(nibName: T.self.cellIdentifier(), bundle: Bundle.main), forCellReuseIdentifier: T.self.cellIdentifier())

            if let myCell: T = self.dequeueReusableCell(indexPath) {
                return myCell

            } else {
                return nil
            }
        }
    }

    /**
     Deque cell of a UITableView for index path.

     - parameter forIndexPath: Index path for dequing cell.

     - returns: void.
     */
    private func dequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath?) -> T? {

        if let myIndexPath = indexPath {

            if let cell = self.dequeueReusableCell(withIdentifier: T.self.cellIdentifier(), for: myIndexPath) as? T {
                return cell
            } else {
                return nil
            }
        } else {

            if let cell = self.dequeueReusableCell(withIdentifier: T.self.cellIdentifier()) as? T {
                return cell
            } else {
                return nil
            }
        }
    }

    /**
     Deque Header of a UITableView for index path.

     - returns: void.
     */
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? {

        if let myCell: T = self.dequeueReusableTableViewHeaderFooterView() {
            return myCell

        } else {

            self.register(UINib(nibName: T.self.viewIdentifier(), bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: T.self.viewIdentifier())

            if let myCell: T = self.dequeueReusableTableViewHeaderFooterView() {
                return myCell

            } else {
                return T()
            }
        }
    }

    /**
     Deque Header of a UITableView for index path.

     - returns: void.
     */
    private func dequeueReusableTableViewHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? {

        if let cell = self.dequeueReusableHeaderFooterView(withIdentifier: T.self.viewIdentifier()) as? T {
            return cell
        } else {
            return nil
        }
    }
}
