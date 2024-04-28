//
//  LaunchScreenView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

 
import SwiftUI
import Alamofire
 
struct LaunchScreenView: View {
    @State private var isShowingLoginView = false
    @State private var isShowingSignupView = false // State variable for SignupView
 
    let primaryColor = Color(hex: "c2a25d")
    let backgroundColor = Color(hex: "053426")
 
    var body: some View {
        NavigationStack { // Use NavigationStack for better control in iOS 16 and later
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    
                    Image(systemName: "chart.bar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.3)
                        .foregroundColor(primaryColor)
                    
                    Text("BitBuggy")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(primaryColor)
                    
                    Text("Welcome to Dashboard")
                        .font(.title2)
                        .foregroundColor(primaryColor.opacity(0.7))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Button("Log In") {
                        isShowingLoginView = true
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(primaryColor)
                    .cornerRadius(20)
                    .padding(.horizontal, 50)
                    
                    Button("Sign Up") {
                        isShowingSignupView = true
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(primaryColor)
                    .cornerRadius(20)
                    .padding(.horizontal, 50)
                    .padding(.top, 15)
                    
                    Spacer()
                }
                .background(backgroundColor.edgesIgnoringSafeArea(.all))
            }
            .navigationDestination(isPresented: $isShowingLoginView) {
                LoginView()
            }
            .navigationDestination(isPresented: $isShowingSignupView) {
                SignupView()
            }
        }
    }
}
 
struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
