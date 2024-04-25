//
//  DashboardView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/5/24.
//

import SwiftUI

struct DashboardView: View {
    @State private var isShowingSideMenu = false // State to control the side menu visibility
    @EnvironmentObject var navigationViewModel: NavigationViewModel
    
    // Define your color palette here
    let backgroundColor = Color(hex: "053426") // Deep green background
    let secondaryBackgroundColor = Color(hex: "38785e") // Lighter green for items background
    let foregroundColor = Color(hex: "c2a25d") // Gold color for the item icons and text
    let headerColor = Color(hex: "c2a25d") // Gold color for the header text
    
    let menuItems = [
        ("Customers", "person.fill"),
        ("Orders", "app.fill"),
        ("Products", "cart.fill"),
        ("Activity", "person.3"),
    ]
    
    var body: some View {
            NavigationView {
                ZStack {
                    mainContent
                        .blur(radius: isShowingSideMenu ? 20 : 0)
                        .animation(.easeInOut, value: isShowingSideMenu)
                        .disabled(isShowingSideMenu)
                    
                    if isShowingSideMenu {
                        sideMenu
                            .transition(.move(edge: .leading))
                    }
                }
                .navigationBarItems(leading: menuButton)
                .navigationBarTitleDisplayMode(.inline)
                .background(backgroundColor.edgesIgnoringSafeArea(.all))
            }
        }

    private var mainContent: some View {
        VStack(spacing: 0) {
            Text("Dashboard")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(headerColor)
                .padding(.top, 20)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity)
                .background(secondaryBackgroundColor)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(menuItems, id: \.0) { item in
                        NavigationLink(destination: Text("\(item.0) Details")) {
                            MenuItemView(name: item.0, imageName: item.1,
                                         backgroundColor: secondaryBackgroundColor,
                                         foregroundColor: foregroundColor)
                        }
                    }
                }
                .padding()
            }
            .background(backgroundColor)
        }
        .navigationBarHidden(true)
    }
    
    private var sideMenu: some View {
        GeometryReader { _ in
            HStack {
                SideMenuView(isShowingSideMenu: $isShowingSideMenu)
                    .frame(width: 250)
                    .offset(x: isShowingSideMenu ? 0 : -250)
                    .animation(.easeInOut, value: isShowingSideMenu)
                    .environmentObject(navigationViewModel)
                    .zIndex(2) // Ensure the menu is above the main content
                Spacer()
            }
        }
        .background(Color.black.opacity(isShowingSideMenu ? 0.5 : 0).ignoresSafeArea().onTapGesture {
            withAnimation {
                isShowingSideMenu = false
            }
        })
    }
    
    private var menuButton: some View {
        Button(action: {
            withAnimation {
                isShowingSideMenu.toggle()
            }
        }) {
            Image(systemName: "line.horizontal.3")
                .foregroundColor(foregroundColor)
                .imageScale(.large)
        }
    }
}
struct MenuItemView: View {
    let name: String
    let imageName: String
    let backgroundColor: Color
    let foregroundColor: Color

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(foregroundColor)
                .padding(30)
                .background(backgroundColor)
                .clipShape(Circle())
                .frame(width: 88, height: 88)
            Text(name)
                .foregroundColor(foregroundColor)
                .frame(width: 120)
        }
        .frame(width: 120, height: 160)
        .padding(.vertical, 8)
        .background(backgroundColor.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
