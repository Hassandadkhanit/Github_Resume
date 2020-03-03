//
//  UserViewModel.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/17/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import Foundation

class UserViewModel {
    
    // MARK: - Properties
    private var webservice: Webservice
    private var completion: (_ userInfo : User?, _ error : NSError?) -> () = { _,_ in }
    
    // MARK: - init
    init(webservice: Webservice, source: String, completion: @escaping (_ userInfo : User?, _ error : NSError?) -> ()) {
        self.webservice = webservice
        self.completion = completion
        
        loadUserAccountInfo(source: source)
    }
    
    // MARK: - Functions
    func loadUserAccountInfo(source: String) {
        
        self.webservice.getRequest(Constants.baseURL + "/\(source)", parameters: nil) { [weak self] (data, error) in
            
            guard let self = self else {return}
            
            if error == nil,
                let data = data {
                
                do {
                    let user :User? = try JSONDecoder().decode(User.self, from: data)
                    self.completion(user, nil)
                } catch {
                    print("Not able to parse user data. error: ", error)
                    self.completion(nil, error as NSError)
                }
            } else {
                print("URLSession dataTask error:", error ?? "nil")
                self.completion(nil, error)
            }
        }
    }
}
