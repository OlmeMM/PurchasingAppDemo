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

    let backgroundColor = Color(hex: "053426") // Deep green background
    let buttonColor = Color(hex: "c2a25d") // Gold color for buttons
    let inputFieldBackgroundColor = Color.white
    let inputFieldBorderColor = Color(hex: "c2a25d") // Gold for borders
    let textColor = Color.white // White text for better contrast

    var body: some View {
        NavigationView {
            VStack {
                Text("Create New Account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(buttonColor)
                    .padding(.horizontal, 16)
                    .padding(.top, 30)
                    .frame(maxWidth: .infinity, alignment: .center)

                Group {
                    TextField("Full Name", text: $fullName)
                        .padding()
                        .background(inputFieldBackgroundColor)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(inputFieldBorderColor, lineWidth: 1)
                        )
                        .padding(.horizontal, 16)

                    TextField("Phone Number", text: $phoneNumber)
                        .padding()
                        .background(inputFieldBackgroundColor)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(inputFieldBorderColor, lineWidth: 1)
                        )
                        .padding(.horizontal, 16)
                        .padding(.top, 16)

                    TextField("E-mail Address", text: $email)
                        .padding()
                        .background(inputFieldBackgroundColor)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(inputFieldBorderColor, lineWidth: 1)
                        )
                        .padding(.horizontal, 16)
                        .padding(.top, 16)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(inputFieldBackgroundColor)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(inputFieldBorderColor, lineWidth: 1)
                        )
                        .padding(.horizontal, 16)
                        .padding(.top, 16)

                    Button("Sign Up") {
                        // Handle sign up action
                    }
                    .foregroundColor(textColor)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(buttonColor)
                    .cornerRadius(10)
                    .padding(.horizontal, 50)
                    .padding(.top, 32)
                }
                Spacer()
            }
            .background(backgroundColor.edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
