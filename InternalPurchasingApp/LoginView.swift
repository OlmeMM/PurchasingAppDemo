//
//  LoginView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/5/24.
//

import SwiftUI
import Alamofire
 
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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
