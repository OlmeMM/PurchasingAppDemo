//
//  SideMenuView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI

 
struct SideMenuView: View {
    @Binding var isShowingSideMenu: Bool
    
    let sideMenuOptions = [
        ("Home", "house.fill"),
        ("Orders", "cart.fill"),
        // Add more menu options here if needed
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(sideMenuOptions, id: \.0) { option in
                NavigationLink(destination: destinationViewForOption(option)) {
                    HStack {
                        Image(systemName: option.1)
                            .foregroundColor(.white) // Set icon color to white
                            .font(.title)
                        Text(option.0)
                            .foregroundColor(.white) // Set text color to white
                            .padding(.leading, 8)
                        Spacer() // Push content to the left edge
                    }
                    .padding(.trailing, 8) // Add padding to the trailing edge of the HStack
                    .padding(.vertical, 4) // Add vertical padding for better spacing
                }
            }
            Spacer() // Push all content to the top
        }
        .padding(.top, 20) // Add top padding to create space from the top edge
        .navigationBarTitle("Menu")
        .navigationBarHidden(true)
    }
    
    // Function to determine destination view for each menu option
    private func destinationViewForOption(_ option: (String, String)) -> some View {
        switch option.0 {
        case "Home":
            return AnyView(HomeView())
        case "Orders":
            return AnyView(OrderView())
        // Add cases for additional menu options if needed
        default:
            return AnyView(EmptyView()) // Return an empty view as default
        }
    }
}
