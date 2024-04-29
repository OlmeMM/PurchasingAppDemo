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
    // Define your UI colors
    let primaryColor = Color(hex: "c2a25d") // Gold color
    let backgroundColor = Color(hex: "053426") // Dark green background
    let secondaryBackgroundColor = Color(hex: "38785e") // Lighter green for item background
    let textColor = Color(hex: "FFFFFF") // White text
    let subtitleTextColor = Color(hex: "BFBFBF") // Subtitle text
    
    
    func fetchProducts() -> [Product] {
        var products = [Product]()
        
        AF.request("https://7c1f-2603-6080-8f01-5295-b011-7537-c673-c88a.ngrok-free.app/product/getAll").response { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        products = try JSONDecoder().decode([Product].self, from: data)
                    } catch let error as NSError {
                        print(error)
                    }
                }
            case .failure(let error):
                print("Error:", error)
            }
        }
        
        return products
    }
    
    // Dummy data for products
    
    var body: some View {
        
        let productList = fetchProducts();
        
        NavigationView {
            List(productList) { product in
// Add 'List' here to correctly create a list of products
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
            }) {})
            .navigationBarTitle("Products", displayMode: .inline)
            .background(backgroundColor.edgesIgnoringSafeArea(.all)) // Use dark green for the background
        }
    }
}
 
 
struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
    
}
 
struct Product: Identifiable, Decodable, Encodable {
        let id: Int
        let name: String
        let price: Double
    }
import Foundation
import Combine
import SwiftUI
 
 
class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    // MARK: - Networking Functions
    
    // Function to fetch products from the server
   
    func fetchProducts() {
        
        guard let url = URL(string: "https://localhost:8080/product/getAll") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        isLoading = true
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    self.errorMessage = "Server error"
                    return
                }
                
                guard let data = data else {
                    self.errorMessage = "No data received"
                    return
                }
                
                do {
                    self.products = try JSONDecoder().decode([Product].self, from: data)
                } catch {
                    self.errorMessage = "Failed to decode product data"
                }
            }
        }.resume()
    }
    
    // Function to add a new product to the server
    func addProduct(product: Product) {
        guard let url = URL(string: "https://localhost:8080/products") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(product)
            request.httpBody = jsonData
        } catch {
            self.errorMessage = "Failed to encode product data"
            return
        }
        
        isLoading = true
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    self.errorMessage = "Server error"
                    return
                }
                
                // Assuming the server responds with the updated list of products,
                // you can handle the response here if needed.
            }
        }.resume()
    }
    
    // Function to delete a product from the server
    func deleteProduct(id: String) {
        guard let url = URL(string: "https://localhost:8080/products/\(id)") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        isLoading = true
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    self.errorMessage = "Server error"
                    return
                }
                
                // Assuming the server responds with success, you may update the UI or perform additional actions.
            }
        }.resume()
    }
}
