//
//  HomeView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI
 
struct HomeView: View {
    @State private var selectedFilter = "All" // Initial filter selection
    
    @State private var isShowingSideMenu = false// State to control the side menu visibility
    
    let primaryColor = Color(hex: "c2a25d")
    let backgroundColor = Color(hex: "053426")
    let lightBackgroundColor = Color(hex: "38785e")
    let textColor = Color(hex: "FFFFFF")
    let subtitleTextColor = Color(hex: "BFBFBF")
    
    let dashboardIcons = [
        ("Customers", "person.2.fill"),
        ("Orders", "cart.fill"),
        ("Products", "bag.fill"),
        ("Activity", "person.3.fill")
    ]
    
    let summaryStats = [
        ("TOTAL REVENUE", "$32,575"),
        ("TOTAL PROFIT", "$20,590"),
        ("TOTAL VIEWS", "17,10K")
    ]
    
    let recentOrders = [
        ("Daniel Wellington Classic", "John Doe - Stripe", "#51202325", "$149.21", "Aug 11"),
        ("Skater Dress", "Adele Camp - Square", "#645644", "$260", "Aug 11"),
        ("Woodland Shoes", "Beverly Alen - Paypal", "#51202563", "$94.54", "Aug 10")
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
        .navigationBarBackButtonHidden(true) // Add this line
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
                    HStack(spacing: 20) {
                        ForEach(dashboardIcons, id: \.0) { icon in
                            VStack {
                                Image(systemName: icon.1)
                                    .font(.title)
                                    .foregroundColor(primaryColor)
                                    .padding()
                                    .background(lightBackgroundColor)
                                    .clipShape(Circle())
                                Text(icon.0)
                                    .font(.caption)
                                    .foregroundColor(textColor)
                            }
                            .frame(width: 80, height: 100)
                        }
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    Image(systemName: "waveform.path.ecg")
                        .foregroundColor(.red)
                    Text("Live Feed")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(textColor)
                }
                .padding(.horizontal)
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(primaryColor, lineWidth: 2)
                    .frame(height: 200)
                    .padding(.horizontal)
                    .overlay(Text("Chart Placeholder").foregroundColor(textColor))
                
                HStack {
                    ForEach(summaryStats, id: \.0) { stat in
                        VStack {
                            Text(stat.0)
                                .foregroundColor(subtitleTextColor)
                                .font(.caption)
                            Text(stat.1)
                                .foregroundColor(textColor)
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal)
                
                HStack(){
                    Text("Recent Orders")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(textColor)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Picker(selection: $selectedFilter, label: Text("Filter")) {
                        Text("All").tag("All")
                        Text("Today").tag("Today")
                        Text("Yesterday").tag("Yesterday")
                        Text("This Week").tag("This Week")
                        Text("This Month").tag("This Month")
                    }
                    .pickerStyle(.menu)
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
