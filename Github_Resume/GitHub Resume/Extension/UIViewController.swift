//
//  UIViewController.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/17/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//


import UIKit

extension UIViewController {

    //MARK: -  Properties
    var myStoryBoard: UIStoryboard {

        if let currentStoryBoard = self.storyboard  {
            return currentStoryBoard
        } else {
            return UIStoryboard(name: "Main", bundle: nil)
        }
    }
}

extension UIViewController {

    /**
     Initialize a nib.

     - returns: UIViewController.
     */
    public class func fromNib<T>() -> T? where T : UIViewController {
        return fromNib(nibName: nil)
    }

    /**
     Initialize a nib.

     - parameter nibName: Nib name.

     - returns: UIViewController.
     */
    public class func fromNib<T>(nibName: String?) -> T? where T : UIViewController {

        let name = nibName ?? String(describing: self)
        return self.init(nibName: name, bundle: Bundle.main) as? T
    }

    /**
     Initialize a UIViewController from Storyboard.

     - returns: UIViewController.
     */
    class func instantiateViewControllerFromStoryboard<T>() -> T? where T : UIViewController {
        return instantiateViewController()
    }

    /**
     Initialize a UIViewController from Storyboard.
     
     - returns: UIViewController.
     */
    fileprivate class func instantiateViewController<T>() -> T? where T : UIViewController  {
        return UIViewController().myStoryBoard.instantiateViewController(withIdentifier: String(describing: self)) as? T
    }

}


//MARK:- Alerts

extension UIViewController {
    /**
     Show error popup with message.

     - parameter message: Message text that need to dispalyed.
     - parameter actionBlock: ok button action.

     - returns: void.
     */
    func showErrorAlertWithMessage(message: String?, _ actionBlock: @escaping OKButtonCompletionHandler = {}) {
        var messageString: String = ""
        if let messageObject = message,
            messageObject.isEmpty == false {
            messageString = messageObject
        } else {
            messageString = TitleMessageConstants.genralError
        }
        self.showAlert(title: TitleMessageConstants.error, message: messageString, actionBlock)
    }

    /**
     Show success popup with message.

     - parameter message: Message text that need to dispalyed.
     - parameter actionBlock: ok button action.

     - returns: void.
     */
    func showSuccessAlertWithMessage(message: String?, _ actionBlock: @escaping OKButtonCompletionHandler = {}) {
        self.showAlert(title: TitleMessageConstants.successful, message: message, actionBlock)
    }

    /**
     Show popup with parameters.

     - parameter title: Popup titile.
     - parameter message: Message text that need to dispalyed.
     - parameter btnTitle: Ok button title. Bydefault its 'OK'.

     - returns: void.
     */
    func showAlert(title: String?, message: String?, btnTitle: String = TitleMessageConstants.OK, _ actionBlock: @escaping OKButtonCompletionHandler = {}) {

        self.showAlert(title: title, attributedMessage: message?.createAttributedString(mainStringColor: UIColor.mainText, mainStringFont: UIFont.body), btnTitle: btnTitle, actionBlock)
    }

    /**
     Show popup with parameters.

     - parameter title: Popup titile.
     - parameter attributedMessage: Message text that need to dispalyed.
     - parameter btnTitle: Ok button title. Bydefault its 'OK'.

     - returns: void.
     */
    func showAlert(title: String?, attributedMessage: NSAttributedString?, btnTitle: String = TitleMessageConstants.OK, _ actionBlock: @escaping OKButtonCompletionHandler = {}) {

        let alertViewController = UIAlertController(title: title, message: attributedMessage?.string ?? "", preferredStyle: .alert)


        let okAction = UIAlertAction(title: btnTitle, style: .default) { (action) in
            actionBlock()
        }

        alertViewController.addAction(okAction)
        self.present(alertViewController, animated: true, completion: nil)
    }

}


//MARK:- ActivityIndicator
extension UIViewController {

    /** Show activity indicator with or without animation. */
    open func showActivityIndicator() {
        ActivityIndicator.shared.showActivityIndicator()

    }

    /** Hide activity indicator with or without animation. */
    open func hideActivityIndicator() {
        ActivityIndicator.shared.hideActivityIndicator()
    }

    /** Hide all activity indicators. */
    open func removeAllActivityIndicator(){
        ActivityIndicator.shared.removeAllActivityIndicator()
    }
}

//MARK:- Error message for Bio authitication

extension UIViewController {

    /**
     Opens a URL in Safari.
     
     - parameter urlString: URL to open.

     - returns: void.
     */
    func openURLInSafari(urlString: String?) {

        // Not Valid URL string
        if urlString == nil || (urlString?.isEmpty ?? true) {
            self.showErrorAlertWithMessage(message: TitleMessageConstants.genralError)
        } else {

            var newURLString = urlString

            /* Updating url */
            if (urlString?.containsSubString("http://") ?? false) == false &&
                (urlString?.containsSubString("https://") ?? false) == false{

                newURLString = "http://\(urlString ?? "")"
            }

            if let requestUrl = URL(string: newURLString?.trimmWhiteSpace ?? ""),
                UIApplication.shared.canOpenURL(requestUrl) {

                if #available(iOS 10, *) {
                    UIApplication.shared.open(requestUrl, options: [:], completionHandler:nil)
                } else {
                    UIApplication.shared.openURL(requestUrl)
                }

            } else {
                self.showErrorAlertWithMessage(message: TitleMessageConstants.genralError)
            }
        }
    }
}
