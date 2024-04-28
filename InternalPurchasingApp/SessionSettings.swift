//
//  SessionSettings.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/24/24.
//

import Foundation
import Alamofire
 
func configureAlamofire(accessToken: String) {
 
    // Define your token
    let token = accessToken
 
    // Create a session configuration
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 30 // Set timeout interval for requests
    configuration.timeoutIntervalForResource = 30 // Set timeout interval for resource
 
    // Optionally, you can configure additional parameters such as caching policy, etc.
    // configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
 
    // Create Alamofire session with the custom configuration
    let sessionManager = Session(configuration: configuration)
 
    // Create headers dictionary with your token
    let headers: HTTPHeaders = [
        "Authorization": "Bearer \(token)",
        "Accept": "application/json"
    ]
 
    // Now you can use this session manager to make requests with headers
    sessionManager.request("https://shippping.bitbuggy.dev/about", headers: headers).responseJSON { response in
        // Handle response
        switch response.result {
        case .success(let value):
            print("Response JSON: \(value)")
        case .failure(let error):
            print("Error: \(error)")
        }
    }
 
}
