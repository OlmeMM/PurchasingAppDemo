//
//  Authorization.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/24/24.
//

import SwiftUI
import Foundation
import Alamofire
import AppAuth
import Combine
 
// Server Side
let clientIDServer = "0f852de5-b6f5-4a89-b149-eb52e3d54d7a"
let clientSecretServer = "e.18Q~x0lKcin3lK1aIKwC_Qhu7~ZwC2ZMuEdbdM"
let secretIDServer = "1b8df665-66ea-4bff-8573-53a440d41e1e"
 
// Mobile App
let issuerMobile = "https://bitbuggy.b2clogin.com/533398db-accf-4cf9-bee1-6b65ce5aa8b9/v2.0/"
let clientIDMobile = "529f2e3b-ca7b-44e6-85d4-290101cfaf90"
let redirectURIsMobile = "https://bitbuggy.b2clogin.com/oauth2/nativeclient"
// "msal529f2e3b-ca7b-44e6-85d4-290101cfaf90://auth"
let authorizationEndPointMobile = "https://bitbuggy.b2clogin.com/bitbuggy.onmicrosoft.com/oauth2/v2.0/authorize?p=b2c_1_bitbuggylogin"
let tokenEndPointMobile = "https://bitbuggy.b2clogin.com/bitbuggy.onmicrosoft.com/oauth2/v2.0/token?p=b2c_1_bitbuggylogin"
let scopesMobile = "openid"
 

 
struct ContentViewAuth: View {
    @State private var authState: OIDAuthState?
    
    var body: some View {
        Button("Sign In with Google") {
            performAuthorization()
        }
    }
    
    private func performAuthorization() {
        let authorizationEndpoint = URL(string: authorizationEndPointMobile)!
        let tokenEndpoint = URL(string: tokenEndPointMobile)!
        let configuration = OIDServiceConfiguration(authorizationEndpoint: authorizationEndpoint,
                                                    tokenEndpoint: tokenEndpoint)
        
        let clientId = clientIDMobile
        let redirectURI = URL(string: redirectURIsMobile)!
        let scope = scopesMobile
        let responseType = OIDResponseTypeCode
        let additionalParameters = ["access_type": "offline"]
        
        let request = OIDAuthorizationRequest(configuration: configuration,
                                              clientId: clientId,
                                              clientSecret: nil,
                                              scopes: [scope],
                                              redirectURL: redirectURI,
                                              responseType: responseType,
                                              additionalParameters: additionalParameters)
        
        guard let viewController = UIApplication.shared.windows.first?.rootViewController else {
            print("Unable to get root view controller")
            return
        }
        
        let currentAuthorizationFlow = OIDAuthState.authState(byPresenting: request,
                                                              presenting: viewController) { (authState, error) in
            if let authState = authState {
                // Handle successful authorization
                print("Authorization was successful. Access token: \(authState.lastTokenResponse?.accessToken ?? "No Access Token")")
                configureAlamofire(accessToken: authState.lastTokenResponse?.accessToken ?? "")
                self.authState = authState
            } else {
                // Handle error
                print("Authorization error: \(error?.localizedDescription ?? "Unknown Error")")
            }
        }
    }
}
 
