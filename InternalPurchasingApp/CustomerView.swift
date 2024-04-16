//
//  CustomerView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI

struct CustomerView: View {
    @Environment(\.presentationMode) var presentationMode
    
    // Dummy data for customers
    let customers = [
        Customer(name: "John Doe", platform: "iPhone · Total Spend $2", createdDate: "Created Jul 12", avatarName: "person.crop.circle.fill"),
        Customer(name: "Beverly Alen", platform: "Android · Total Spend $34", createdDate: "Created Apr 2", avatarName: "person.crop.circle.fill"),
        // ... more customers
    ]
    
    var body: some View {
        NavigationView {
            List(customers) { customer in
                HStack(spacing: 16) {
                    Image(systemName: customer.avatarName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(customer.name)
                            .font(.headline)
                        Text(customer.platform)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Text(customer.createdDate)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Dashboard")
                }
                .foregroundColor(.blue)
            })
            .navigationBarTitle("Customers", displayMode: .inline)
            .background(Divider().padding(.top, 10), alignment: .top) // Adjust padding as necessary for alignment
        }
    }
}

struct Customer: Identifiable {
    let id = UUID()
    let name: String
    let platform: String
    let createdDate: String
    let avatarName: String
}

struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
    }
}

