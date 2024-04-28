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
    @Environment(\.presentationMode) var presentationMode  // Used to dismiss the view
    
    @State private var emailOrPhone = ""
    @State private var password = ""
    
    let backgroundColor = Color(hex: "053426") // Deep green background
    let buttonColor = Color(hex: "c2a25d") // Gold color for buttons
    let inputFieldBorderColor = Color(hex: "c2a25d") // Gold color for input fields border
    let textColor = Color.white // White text for better contrast
    
    @State private var isDashboardActive = false // Added state for navigation
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Text("Sign In")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(textColor)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Group {
                    TextField("E-mail or phone number", text: $emailOrPhone)
                        .padding()
                        .background(Color.white) // White background for text field
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(inputFieldBorderColor, lineWidth: 1)
                        )
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white) // White background for secure field
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(inputFieldBorderColor, lineWidth: 1)
                        )
                    
                    NavigationLink(destination: HomeView()) {
                        Text("Log In")
                            .foregroundColor(textColor)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(buttonColor)
                            .cornerRadius(10)
                        
                        // Add addictional code
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
                Spacer()
            }
            .background(backgroundColor.edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
        }
    }
}
 
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
