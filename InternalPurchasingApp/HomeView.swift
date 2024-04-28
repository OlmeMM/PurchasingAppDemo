//
//  HomeView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedFilter = "All" // Initial filter selection
    
    @State private var isShowingSideMenu = false // State to control the side menu visibility
    
    let primaryColor = Color(hex: "c2a25d")
    let backgroundColor = Color(hex: "053426")
    let lightBackgroundColor = Color(hex: "38785e")
    let textColor = Color(hex: "FFFFFF")
    let subtitleTextColor = Color(hex: "BFBFBF")
    
    let dashboardIcons = [
        ("Orders", "cart.fill"),
        ("Products", "bag.fill")
    ]
    
    let dashboardIconsNavg: [AnyView] = [
        AnyView(OrderView()),
        AnyView(ProductsView())
    ]
    
    let recentOrders = [
        ("Daniel Wellington Classic", "John Doe - Stripe", "#51202325", "$149.21", "Apr 28"),
        ("Skater Dress", "Adele Camp - Square", "#645644", "$260", "Apr 27"),
        ("Woodland Shoes", "Beverly Alen - Paypal", "#51202563", "$94.54", "Apr 23"),
        ("Test 1", "Beverly Alen - Payherf", "#51204343", "$23.50", "Feb 21")
    ]
    
    var body: some View {
        ZStack {
            mainContent
                .blur(radius: isShowingSideMenu ? 20 : 0)
                .animation(.easeInOut, value: isShowingSideMenu)
                .disabled(isShowingSideMenu)
            
            // Side Menu layer
            if isShowingSideMenu {
                sideMenu
            }
        }
        .navigationBarItems(leading: menuButton)
        .navigationBarTitleDisplayMode(.inline)
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(true)
    }
    
    private var mainContent: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
                    .padding([.horizontal, .top])
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(alignment: .leading, spacing: 20) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 60) {
                        ForEach(dashboardIcons.indices, id: \.self) { index in
                            NavigationLink(destination: dashboardIconsNavg[index]) {
                                VStack {
                                    Image(systemName: dashboardIcons[index].1)
                                        .font(.title)
                                        .foregroundColor(primaryColor)
                                        .padding()
                                        .background(lightBackgroundColor)
                                        .clipShape(Circle())
                                    Text(dashboardIcons[index].0)
                                        .font(.caption)
                                        .foregroundColor(textColor)
                                }
                                .frame(width: 80, height: 100)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                HStack(){
                    Text("Recent Orders")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(textColor)
                        .padding(.horizontal)
                    
                    Spacer()
                }
                
                ForEach(recentOrders, id: \.1) { order in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(order.0)
                                .foregroundColor(textColor)
                            Text(order.1)
                                .font(.caption)
                                .foregroundColor(subtitleTextColor)
                            Text(order.2)
                                .font(.caption)
                                .foregroundColor(subtitleTextColor)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(order.3)
                                .foregroundColor(textColor)
                                .fontWeight(.bold)
                            Text(order.4)
                                .font(.caption)
                                .foregroundColor(subtitleTextColor)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .background(backgroundColor)
        }
    }
    
    private var sideMenu: some View {
        GeometryReader { _ in
            HStack {
                SideMenuView(isShowingSideMenu: $isShowingSideMenu)
                    .frame(width: 250)
                    .transition(.move(edge: .leading))
                Spacer()
            }
        }
        .background(Color.black.opacity(0.5).onTapGesture {
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
                .foregroundColor(textColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
