//
//  SignupView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI

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
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
