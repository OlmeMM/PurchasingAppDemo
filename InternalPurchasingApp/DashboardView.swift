//
//  DashboardView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/5/24.
//

import SwiftUI
import Alamofire


struct DashboardView: View {
    @State private var isShowingSideMenu = false

    // Define an array for the menu items
    let menuItems = [
        ("Analytics", "waveform.path.ecg"),
        ("Customers", "person.fill"),
        ("Orders", "app.fill"),
        ("Tasks", "text.badge.checkmark"),
        ("Sales", "banknote.fill"),
        ("Products", "cart.fill")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Your DashboardView content here...
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(menuItems, id: \.0) { item in
                            NavigationLink(destination: Text("\(item.0) Details")) {
                                MenuItemView(name: item.0, imageName: item.1)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Dashboard")
                .navigationBarItems(leading: Button(action: {
                    withAnimation {
                        isShowingSideMenu = true
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.blue)
                })

                // Overlay for SideMenuView
                if isShowingSideMenu {
                    SideMenuView(isShowingSideMenu: $isShowingSideMenu)
                }
            }
        }
    }
}

// Define MenuItemView for reuse
struct MenuItemView: View {
    let name: String
    let imageName: String

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
                .background(Color(UIColor.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            Text(name)
        }
        .frame(height: 120)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
