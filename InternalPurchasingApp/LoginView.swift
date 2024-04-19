//
//  LoginView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/5/24.
//

import SwiftUI
import Alamofire
import AppAuth
 
struct LoginView: View {
    @State private var emailOrPhone = ""
    @State private var password = ""

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Sign In")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()

            TextField("E-mail or phone number", text: $emailOrPhone)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal, 16)
            
            SecureField("Password", text: $password)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal, 16)
                .padding(.top, 16)

            Button("Log In") {
                // Handle log in action
                performOAuthAuthorization()
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.horizontal, 50)
            .padding(.top, 32)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }

    func performOAuthAuthorization() {
        // Set up OAuth 2.0 configuration
        guard let issuer = URL(string: "ISSUER_URL"),
              let redirectURI = URL(string: "msal529f2e3b-ca7b-44e6-85d4-290101cfaf90://auth https://bitbuggy.b2clogin.com/oauth2/nativeclient") else {
            print("Invalid configuration. Missing required information.")
            return
        }

        let configuration = OIDServiceConfiguration(authorizationEndpoint: issuer.appendingPathComponent("oauth/authorize"),
                                                    tokenEndpoint: issuer.appendingPathComponent("oauth/token"))

        // Create authorization request
        let request = OIDAuthorizationRequest(configuration: configuration,
                                               clientId: "529f2e3b-ca7b-44e6-85d4-290101cfaf90",
                                               clientSecret: nil,
                                               scopes: ["YOUR_SCOPE"],
                                               redirectURL: redirectURI,
                                               responseType: OIDResponseTypeCode,
                                               additionalParameters: nil)

        // Perform authorization request
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            print("Unable to find root view controller.")
            return
        }

        OIDAuthState.authState(byPresenting: request, presenting: rootViewController) { authState, error in
            if authState != nil {
                // Authorization successful
                // Save authState for later use
                var token = ""
            } else {
                // Authorization failed
                print("Authorization error: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
