//
//  ActivityFeedView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI

struct ActivityFeedView: View {
    // Dummy data for activity feed
    let activityItems = [
        ActivityItem(iconName: "cart.fill", description: "Order Placed", detail: "#3214123", date: "Jul 12, 2018", color: .green),
        // ... more activity items
    ]

    var body: some View {
        NavigationView {
            List(activityItems) { item in
                HStack {
                    Image(systemName: item.iconName)
                        .foregroundColor(item.color)
                        .frame(width: 20, height: 20)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text(item.description)
                                .fontWeight(.semibold)
                            Spacer()
                            Text(item.detail)
                                .fontWeight(.semibold)
                        }
                        Text(item.date)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationBarTitle("Activity Feed", displayMode: .inline)
        }
    }
}

struct ActivityItem: Identifiable {
    let id = UUID()
    let iconName: String
    let description: String
    let detail: String
    let date: String
    let color: Color
}

struct ActivityFeedView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityFeedView()
    }
}
