//
//  ResumeViewModel.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/18/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

class ResumeViewModel {
    
    // MARK:- Properties
    var userInfo: User?
    var reposListViewModel: ReposListViewModel?
    
    // MARK:- init
    init(webservice: Webservice, user: User?, completion: @escaping (_ error: NSError?) -> ()) {

        self.userInfo = user
        reposListViewModel = ReposListViewModel(webservice: webservice, reposURL: self.userInfo?.repos_url ?? "", completion: completion)
    }
}
