//
//  ProductsView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI

struct ProductsView: View {
    @Environment(\.presentationMode) var presentationMode

    // Dummy data for products
    let products = [
        Product(name: "Zapatos shoes", description: "The Black 9 Shoes look", status: "Created Jul 12", imageName: "shoeprints.fill"),
        // ... add other products here
    ]

    var body: some View {
        NavigationView {
            List(products) { product in
                HStack {
                    Image(systemName: product.imageName) // Replace with your image assets
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)

                    VStack(alignment: .leading, spacing: 5) {
                        Text(product.name)
                            .font(.headline)
                        Text(product.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    Text(product.status)
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
            .navigationBarTitle("Products", displayMode: .inline)
        }
    }
}

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let status: String
    let imageName: String
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
