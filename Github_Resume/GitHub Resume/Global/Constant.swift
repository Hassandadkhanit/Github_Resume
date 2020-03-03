//
//  Constant.swift
//  GitHub Resume
//
//  Created by Hassan dad khan on 02/03/2020.
//  Copyright © 2020 Hassan dad khan. All rights reserved.
//

import Foundation

//MARK: - Clobal Typealias
typealias OKButtonCompletionHandler = () -> ()

struct Constants {
    
    static let baseURL = "https://api.github.com/users"
    static let errorDomain = "com.es.webserviceerror"
    static let requestTimeOut : TimeInterval = 60
}

struct TitleMessageConstants {

    //MARK: - Titles
    static let OK = "OK"
    static let error = "Error"
    static let successful = "Successful"
    static let yes = "Yes"
    static let no = "No"

    //MARK: - Messages
    static let networkDisconnected = "No internet connection to get updated data."
    static let genralError = "Something went wrong. We apologize for any inconvenience. Please try again."
}


struct DateFormateConstants {

    static let long = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    static let short = "yyyy"
}
