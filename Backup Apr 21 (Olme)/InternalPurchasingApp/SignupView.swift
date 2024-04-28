//
//  SignupView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI
import AppAuthCore

struct SignupView: View {
    @State private var fullName = ""
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack {
            Spacer()
            
            Text("Create new account")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 40)
            
            TextField("Full Name", text: $fullName)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal, 16)
            
            TextField("Phone Number", text: $phoneNumber)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal, 16)
                .padding(.top, 16)

            TextField("E-mail Address", text: $email)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal, 16)
                .padding(.top, 16)
            
            SecureField("Password", text: $password)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal, 16)
                .padding(.top, 16)
            
            Button("Sign Up") {
                // Handle sign up action
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
        .padding(.bottom, 50) // Adjust the spacing from the bottom of the view if necessary
    }
    
    func performOAuthAuthorization() {
            // Set up OAuth 2.0 configuration
            guard let issuer = URL(string: "ISSUER_URL"),
                  let redirectURI = URL(string: "msal529f2e3b-ca7b-44e6-85d4-290101cfaf90://auth") else {
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
                } else {
                    // Authorization failed
                    print("Authorization error: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
