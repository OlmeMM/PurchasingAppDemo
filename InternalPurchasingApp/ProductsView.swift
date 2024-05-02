//
//  ProductsView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import Alamofire
import Foundation
import SwiftUI
 
struct ProductsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var productList: [Product] = []
    // Define your UI colors
    let primaryColor = Color(hex: "c2a25d") // Gold color
    let backgroundColor = Color(hex: "053426") // Dark green background
    let secondaryBackgroundColor = Color(hex: "38785e") // Lighter green for item background
    let textColor = Color(hex: "c2a25d") // Gold text replacing white
    let subtitleTextColor = Color(hex: "BFBFBF") // Subtitle text

    func fetchProductList(completion: @escaping ([Product]) -> Void) {
        AF.request("https://7c1f-2603-6080-8f01-5295-b011-7537-c673-c88a.ngrok-free.app/product/getAll").response { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let productList = try JSONDecoder().decode([Product].self, from: data)
                        completion(productList) // Call completion with fetched data
                    } catch let error as NSError {
                        print(error)
                        completion([]) // Call completion with an empty array in case of error
                    }
                }
            case .failure(let error):
                print("Error:", error)
                completion([]) // Call completion with an empty array in case of failure
            }
        }
    }

    var body: some View {
        NavigationView {
            List(productList, id: \.id) { product in
                productView(product: product)
            }
            .onAppear {
                fetchProductList { products in
                    productList = products
                }
            }
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Home")
                }
                .foregroundColor(primaryColor) // Apply primary color here
            })
            .navigationBarTitle("Products", displayMode: .inline)
            .navigationBarHidden(true)
            .background(backgroundColor) // Set the background color of the navigation view
        }
    }

    private func productView(product: Product) -> some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("\n Category Id: \(product.categoryId)")
                        .font(.headline)
                        .foregroundColor(textColor) // Apply primary color to text
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("\n Name: \(product.name)")
                        .font(.headline)
                        .foregroundColor(textColor) // Apply primary color to text
                    Text("\n Price: \(String(format: "%.2f", product.price))")
                        .font(.subheadline)
                        .foregroundColor(subtitleTextColor) // Applying subtitle text color
                }
                Spacer()
            }
            .padding()
            .background(secondaryBackgroundColor) // Light green background for items
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
}

struct Product: Identifiable, Codable {
    let id: Int
    let name: String
    let categoryId: Int
    let price: Double
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}

//import Foundation
//import Combine
//import SwiftUI
 
 
//class ProductsViewModel: ObservableObject {
//    @Published var products: [Product] = []
//    @Published var isLoading = false
//    @Published var errorMessage: String?

