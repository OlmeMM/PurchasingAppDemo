//
//  HomeView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI

struct HomeView: View {
    
    // Definitions for dashboard shortcut icons
    let dashboardIcons = [
        ("Customers", "person.2.fill"),
        ("Orders", "cart.fill"),
        ("Products", "bag.fill")
    ]
    
    // Dummy data for demonstration purposes
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
    
    @State private var selectedFilter = "All" // Initial filter selection
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                // Home Title
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding([.top, .leading, .trailing])
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color (hex: "38785e"))
            
            VStack(alignment: .leading) {
                
                
                // Dashboard shortcut icons
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 60) {
                        ForEach(dashboardIcons, id: \.0) { icon in
                            VStack {
                                Image(systemName: icon.1)
                                    .font(.title)
                                    .foregroundColor(.blue)
                                    .padding()
                                    .background(Color(hex: "#c2a25d"))
                                    .clipShape(Circle())
                                Text(icon.0)
                                    .font(.caption)
                            }
                            .frame(width: 80, height: 100)
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Live Feed (Overview) with a red icon to show it's live
                HStack {
                    Image(systemName: "waveform.path.ecg") // Placeholder for live icon
                        .foregroundColor(.red)
                    Text("Live Feed")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
                
                // Dummy Chart Placeholder - you would integrate an actual chart view here
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
                    .frame(height: 200)
                    .padding()
                    .overlay(Text("Chart Placeholder"))
                
                // Summary Statistics
                HStack {
                    ForEach(summaryStats, id: \.0) { stat in
                        VStack {
                            Text(stat.0)
                                .font(.caption)
                            Text(stat.1)
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding()
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Recent Orders")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    Spacer()
                    
                    // Filter Picker
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
                            Text(order.0) // Item name
                            Text(order.1) // Description
                                .font(.caption)
                            Text(order.2) // Order ID
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(order.3) // Price
                                .fontWeight(.bold)
                            Text(order.4) // Date
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
            
            .background(Color(hex: "053426"))
            .foregroundColor(.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
