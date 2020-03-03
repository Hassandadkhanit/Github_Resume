//
//  ActivityIndicator.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/17/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

//MARK:- ActivityIndicator Class
final class ActivityIndicator {
    
    // MARK:- Shared Instance
    static let shared = ActivityIndicator()
    
    // MARK:- Properties
    private let container: UIView = UIView()
    private let loadingView: UIView = UIView()
    private let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    private let containerViewTag = 92119211
    
    private let imageView: UIImageView = UIImageView()
    private var loaderCount = 0
    
    // MARK:- Constructor
    private init() {
        
        container.tag = self.containerViewTag
        container.frame = UIScreen.main.bounds
        container.center = UIScreen.main.bounds.center
        container.backgroundColor = UIColor.loaderTransparent
        
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = container.center
        loadingView.backgroundColor = UIColor.black
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40);

        if #available(iOS 13.0, *) {
            activityIndicator.style = UIActivityIndicatorView.Style.large
        } else {
            activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        }

        activityIndicator.color = .white
        activityIndicator.center = CGPoint(x:loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
    }
    
    
    /**
     Show customized activity indicator.
     
     - returns: void.
     */
    func showActivityIndicator() {
        
        if let window = UIApplication.shared.keyWindowInConnectedScenes {
            
            loaderCount = loaderCount + 1
            
            if window.viewWithTag(self.containerViewTag) == nil {
                window.addSubview(container)
            }
            
            window.bringSubviewToFront(container)
            
            self.container.alpha = 1
            self.container.transform = .identity
            
            self.activityIndicator.startAnimating()
        }
    }
    
    
    /**
     Hide activity indicator.
     
     - returns: void.
     */
    func hideActivityIndicator() {
        
        self.loaderCount = loaderCount - 1
        
        if (loaderCount <= 0) {
            self.loaderCount = 0
            
            
            self.container.alpha = 0
            self.activityIndicator.stopAnimating()
            self.container.removeFromSuperview()        }
    }
    
    /**
     Hide all activity indicators.
     
     - returns: void.
     */
    func removeAllActivityIndicator() {
        
        self.loaderCount = 0
        self.hideActivityIndicator()
        
        UIApplication.shared.keyWindowInConnectedScenes?.subviews.forEach({ (aView) in
            
            // If found in window subview then remove
            if aView.tag == self.containerViewTag {
                
                if let activityIndicator = (aView.subviews.first ?? UIView()).subviews.first as? UIActivityIndicatorView {
                    activityIndicator.stopAnimating()
                }
                aView.removeFromSuperview()
            }
        })
    }
}
