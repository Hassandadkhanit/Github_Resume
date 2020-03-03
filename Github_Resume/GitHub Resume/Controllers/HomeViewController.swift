//
//  HomeViewController.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/16/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    //MARK: - Private Properties
    private var webservice :Webservice!
    private var userViewModel :UserViewModel!
    
    //MARK: - IBOutlet
    @IBOutlet var contentScrollView : UIScrollView?
    @IBOutlet var contentView : UIView?
    @IBOutlet var textField : UITextField?

    //MARK: - ViewController overriden methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webservice = Webservice()
        textField?.delegate = self
        
        #if DEBUG
        textField?.text = "mxcl"
        #else
        textField?.text = ""
        #endif
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - IBAction
    @IBAction func loadInfoAction(_ sender: UIButton?) {
        
        _ = textField?.resignFirstResponder()
        
        if let queryUserText = textField?.text,
            queryUserText.isEmpty == false { /* Validating user input */
            
            self.showActivityIndicator()
            userViewModel = UserViewModel(webservice: webservice, source: queryUserText, completion: { [weak self] (user, error) in
                
                guard let self = self else {return}
                
                self.hideActivityIndicator()
                
                if error != nil {
                    error?.showServerErrorInViewController(self)
                } else {
                    self.redirectToResumeViewController(with: user)
                }
            })
        } else {
            self.showErrorAlertWithMessage(message: "Please enter user name and try again.")
        }
    }
    
    //MARK: - Functions
    private func redirectToResumeViewController(with userInfo :User?) {
        
        if let resumeViewController: ResumeViewController = ResumeViewController.instantiateViewControllerFromStoryboard() {
            
            resumeViewController.userInfo = userInfo
            self.navigationController?.pushViewController(resumeViewController, animated: true)
        }
    }
}

//MARK: - ContentView handling accourding to keyboard
extension HomeViewController {
    
    @objc private func keyboardWillAppear(_ notification: Notification) {
        self.contentScrollView?.adjustKeyboardShow(true, notification: notification)
    }
    
    @objc private func keyboardWillDisappear(_ notification: Notification) {
        self.contentScrollView?.adjustKeyboardShow(false, notification: notification)
    }
}

//MARK: - UITextfield delegate
extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        _ = textField.resignFirstResponder()
        return true
    }
}
