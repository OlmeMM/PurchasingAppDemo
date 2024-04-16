//
//  LaunchScreenView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI
import Alamofire

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
    }
}


struct LaunchScreenView: View {
    // Use the `hex:` label for custom initializer
    let primaryColor = Color(hex: "c2a25d")
    let backgroundColor = Color(hex: "053426")

    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                // Your app logo or image
                Image(systemName: "chart.bar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.3)
                    .foregroundColor(primaryColor)
                
                
                // Welcome text
                Text("BitBuggy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(primaryColor)
                    
                
                // Subtitle text
                Text("Welcome to Dashboard")
                    .font(.title2)
                    .foregroundColor(primaryColor.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                // Login button
                Button(action: {
                    // Handle login action
                }) {
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(primaryColor)
                        .cornerRadius(20)
                }
                .padding(.horizontal, 50)
                
                // Sign up button
                Button(action: {
                    // Handle sign-up action
                }) {
                    Text("Sign Up")
                        .font(.headline) .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(primaryColor)
                        .cornerRadius(20)
                    
                }
                .padding(.horizontal, 50)
                .padding(.top, 15)
                
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
                        .background(backgroundColor.edgesIgnoringSafeArea(.all))
        }
    }
    
    
    struct LaunchScreenView_Previews: PreviewProvider {
        static var previews: some View {
            LaunchScreenView()
        }
    }
}
