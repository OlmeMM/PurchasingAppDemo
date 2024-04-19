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
        ("Analytics", "waveform.path.ecg"),
        ("Customers", "person.2.fill"),
        ("Orders", "cart.fill"),
        ("Sales", "tag.fill"),
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
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Home Title
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding([.top, .leading, .trailing])

                // Dashboard shortcut icons
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(dashboardIcons, id: \.0) { icon in
                            VStack {
                                Image(systemName: icon.1)
                                    .font(.title)
                                    .foregroundColor(.blue)
                                    .padding()
                                    .background(Color(UIColor.systemGray6))
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
                
                // Recent Orders Section
                Text("Recent Orders")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
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
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
