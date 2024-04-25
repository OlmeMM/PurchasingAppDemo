import Foundation
import SwiftUI
import Alamofire
import MSAL

// Mobile App
let clientIDMobile = "529f2e3b-ca7b-44e6-85d4-290101cfaf90"
let authorityURIMobile = "https://bitbuggy.b2clogin.com/tfp/bitbuggy.onmicrosoft.com/B2C_1_BitBuggyLogin"
let redirectURIMobile = "msal529f2e3b-ca7b-44e6-85d4-290101cfaf90://auth"

//
//=====================================================================================================
//=====================================================================================================
//=====================================================================================================
//
//
//
//
//
//
//
//  Authorization.swift
//  InternalPurchasingApp
//
//  Created by Olme Matias Molina on 4/24/24.
//
//
//
//
//
//
//
//=====================================================================================================
//=====================================================================================================
//=====================================================================================================
//

class AuthManager {
    static let shared = AuthManager()
    
    private let kClientID = clientIDMobile
    private let kAuthority = authorityURIMobile
    private let kRedirectUri = redirectURIMobile
    
    private let kScopes: [String] = ["Order.Create"]
    
    private var application: MSALPublicClientApplication?
    
    private init() {
        do {
            let authority = try MSALAuthority(url: URL(string: kAuthority)!)
            let config = MSALPublicClientApplicationConfig(clientId: kClientID, redirectUri: kRedirectUri, authority: authority)
            application = try MSALPublicClientApplication(configuration: config)
        } catch let error {
            print("Unable to create Application Context \(error)")
        }
    }
    
    func acquireTokenInteractively(completion: @escaping (Result<String, Error>) -> Void) {
        guard let application = application else {
            completion(.failure(NSError(domain: "AuthManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "MSALApplication not initialized"])))
            return
        }
        
        let interactiveParameters = MSALInteractiveTokenParameters(scopes: kScopes)
        
        application.acquireToken(with: interactiveParameters) { (result, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                if let accessToken = result?.accessToken {
                    completion(.success(accessToken))
                } else {
                    completion(.failure(NSError(domain: "AuthManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "Access token not found"])))
                }
            }
        }
    }
}

struct ContentViewAuth: View {
    @State private var isAuthenticated = false
    @State private var accessToken: String?
    
    var body: some View {
        VStack {
            if isAuthenticated {
                Text("Authenticated")
                if let accessToken = accessToken {
                    Text("Access Token: \(accessToken)")
                }
            } else {
                Button("Sign In") {
                    AuthManager.shared.acquireTokenInteractively { result in
                        switch result {
                        case .success(let token):
                            self.accessToken = token
                            self.isAuthenticated = true
                        case .failure(let error):
                            print("Failed to acquire token: \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
        .onAppear {
            // Check if user is already authenticated
            // Implement logic here if needed
        }
    }
}
