//
//  ReposListViewModel.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/25/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import Foundation

class ReposListViewModel {

    // MARK:- Properties
    var repos : [Repository]?
    private var webservice: Webservice
    private var completion: (_ error: NSError?) -> () = { _ in }

    // MARK:- init
    init(webservice: Webservice, reposURL: String, completion: @escaping (_ error: NSError?) -> ()) {

        self.webservice = webservice
        self.completion = completion
        loadUserRepos(formURL: reposURL)
    }

    // MARK:- Functions
    func loadUserRepos(formURL reposURL: String) {

        self.webservice.getRequest(reposURL , parameters: ["type" : "all", "sort" : "updated", "direction" : "desc"]) { [weak self] (data, error) in

            guard let self = self else {return}

            if error == nil,
                let data = data {

                do {
                    self.repos = try JSONDecoder().decode([Repository].self, from: data)
                    self.completion(nil)
                } catch (let error) {
                    print("Not able to parse repos data. error: ", error)
                    self.completion(error as NSError)
                }
            } else {
                print("URLSession dataTask error:", error ?? "nil")
                self.completion(error)
            }
        }
    }
}
