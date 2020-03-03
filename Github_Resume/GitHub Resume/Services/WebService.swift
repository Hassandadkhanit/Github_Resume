//
//  WebService.swift
//  GitHub Resume
//
//  Created by Hassan dad khan on 02/03/2020.
//  Copyright © 2020 Hassan dad khan. All rights reserved.
//

import Foundation

class Webservice {

    func getRequest(_ url: String,
                    parameters: [String: String]?,
                    completion: @escaping (Data?, NSError?) -> Void) {
        
        var components = URLComponents(string: url)
        
        components?.queryItems = parameters?.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        let percentEncodedQuery = components?.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        components?.percentEncodedQuery = percentEncodedQuery
        
        guard let requestURL = components?.url else {
            DispatchQueue.main.async {
                completion(nil, self.createError(TitleMessageConstants.genralError))
            }
            return
        }
        
        URLSession.shared.dataTask(with: requestURL) { [weak self] data, response, error in

            guard let self = self else {return}
            
            if let validData = data,                            // is there data
                let response = response as? HTTPURLResponse,    // is there HTTP response
                error == nil {                                  // was there no error, otherwise ...
                
                var userData :Data?
                var compliedError :NSError?
                
                if (200 ..< 300) ~= response.statusCode { // is statusCode 2XX
                    
                    userData = validData
                    
                } else {
                    
                    let json = try? JSONSerialization.jsonObject(with: data ?? Data(), options: []) as? [String: Any]
                    
                    compliedError = self.createError((json?["message"] as? String))
                }
                
                DispatchQueue.main.async {
                    completion(userData, compliedError)
                }
                
            } else {
                
                DispatchQueue.main.async {
                    completion(nil, error as NSError?)
                }
            }
        }.resume()
    }

    /**
     Create an NSError using description.

     - parameter errorDescription: error localized description.

     - returns: NSError with description.
     */
    private func createError(_ errorDescription: String?) -> NSError {
        var description = TitleMessageConstants.genralError
        
        
        if let errorDescription = errorDescription {
            description = errorDescription
        }
        
        let userInfo : [String: Any] = [NSLocalizedDescriptionKey: description]
        
        return NSError(domain: Constants.errorDomain, code: 0, userInfo: userInfo)
    }
    
}
