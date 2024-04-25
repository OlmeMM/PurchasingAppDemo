//
//  ProductsView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI

struct ProductsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    // Define your UI colors
       let primaryColor = Color(hex: "c2a25d") // Gold color
       let backgroundColor = Color(hex: "053426") // Dark green background
       let secondaryBackgroundColor = Color(hex: "38785e") // Lighter green for item background
       let textColor = Color(hex: "FFFFFF") // White text
       let subtitleTextColor = Color(hex: "BFBFBF") // Subtitle text


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
                            .foregroundColor(primaryColor) // Use the primary color for the image

                        VStack(alignment: .leading, spacing: 5) {
                            Text(product.name)
                                .font(.headline)
                                .foregroundColor(textColor) // Use white color for primary text
                            Text(product.description)
                                .font(.subheadline)
                                .foregroundColor(subtitleTextColor) // Use subtitle text color for secondary text
                        }

                        Spacer()

                        Text(product.status)
                            .font(.caption)
                            .foregroundColor(subtitleTextColor) // Use subtitle text color for the status
                    }
                    .listRowBackground(secondaryBackgroundColor) // Use lighter green for list row background
                }
                .listStyle(PlainListStyle())
                .navigationBarItems(leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Dashboard")
                    }
                    .foregroundColor(primaryColor) // Use primary color for navigation button text
                })
                .navigationBarTitle("Products", displayMode: .inline)
                .background(backgroundColor.edgesIgnoringSafeArea(.all)) // Use dark green for the background
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
