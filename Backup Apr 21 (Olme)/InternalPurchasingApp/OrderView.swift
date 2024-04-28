//
//  OrderView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI

struct OrderView: View {
    @Environment(\.presentationMode) var presentationMode
    
    // Dummy data for orders
    let orders = [
        Order(productName: "Daniel Wellington Classic", buyerInfo: "John Doe · Stripe · #51202325 · Aug 11", price: "$149.21", imageName: "watch"),
        // ... add other orders here
    ]

    var body: some View {
        NavigationView {
            List(orders) { order in
                HStack {
                    Image(order.imageName) // Ensure this image exists in your assets
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)

                    VStack(alignment: .leading, spacing: 5) {
                        Text(order.productName)
                            .font(.headline)
                        Text(order.buyerInfo)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    Text(order.price)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Home")
                }
                .foregroundColor(.blue)
            })
            .navigationBarTitle("Orders", displayMode: .inline)
        }
    }
}

struct Order: Identifiable {
    let id = UUID()
    let productName: String
    let buyerInfo: String
    let price: String
    let imageName: String
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
