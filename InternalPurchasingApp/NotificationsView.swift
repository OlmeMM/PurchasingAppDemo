//
//  NotificationsView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI

struct NotificationsView: View {
    // Dummy data for notifications
    let notifications = [
        NotificationItem(category: "CALENDAR", title: "Your staff meeting starts in 15 minutes.", timeAgo: "1 day ago", iconName: "calendar", isUnread: true),
        // ... more notifications
    ]
    
    var body: some View {
        NavigationView {
            List(notifications) { item in
                HStack(alignment: .top) {
                    Image(systemName: item.iconName)
                        .foregroundColor(.gray)
                        .frame(width: 24, height: 24, alignment: .center)
                        .padding(.top, 8)
                    
                    VStack(alignment: .leading) {
                        Text(item.category)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        Text(item.title)
                            .fontWeight(item.isUnread ? .bold : .regular)
                        Text(item.timeAgo)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 8)
                    
                    Spacer()
                    
                    // Unread notification indicator
                    if item.isUnread {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.orange)
                            .padding(.top, 8)
                    }
                }
                .padding(.vertical, 4)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Notifications", displayMode: .inline)
        }
    }
}

struct NotificationItem: Identifiable {
    let id = UUID()
    let category: String
    let title: String
    let timeAgo: String
    let iconName: String
    let isUnread: Bool
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
