//
//  OrderView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//


import SwiftUI
import Alamofire
 


let primaryColor = Color(hex: "c2a25d") // Gold color
let backgroundColor = Color(hex: "053426") // Dark green background
let secondaryBackgroundColor = Color(hex: "38785e") // Lighter green for item background
let textColor = Color(hex: "FFFFFF") // White text
let subtitleTextColor = Color(hex: "BFBFBF") // Subtitle text

struct OrderView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var internalOrders: [InternalOrder] = []

    func fetchInternalOrder(completion: @escaping ([InternalOrder]) -> Void) {
        AF.request("https://7c1f-2603-6080-8f01-5295-b011-7537-c673-c88a.ngrok-free.app/internalOrder/getAll").response { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let internalOrders = try JSONDecoder().decode([InternalOrder].self, from: data)
                        completion(internalOrders)
                    } catch {
                        print(error)
                        completion([])
                    }
                }
            case .failure(let error):
                print("Error:", error)
                completion([])
            }
        }
    }

    var body: some View {
        NavigationView {
            List(internalOrders, id: \.id) { order in
                internalOrderView(order: order)
            }
            .onAppear {
                fetchInternalOrder { orders in
                    internalOrders = orders
                }
            }
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Home")
                }
                .foregroundColor(primaryColor) // Changed to primaryColor
            })
            .navigationBarTitle("Orders", displayMode: .inline)
            .navigationBarHidden(true)
            .background(backgroundColor) // Set the background color of the navigation view
        }
    }

    private func internalOrderView(order: InternalOrder) -> some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Notes: \(order.notes)")
                        .font(.headline)
                        .foregroundColor(textColor) // Applying white text color
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("Total Amount: \(String(format: "%.2f", order.totalAmount))")
                        .font(.headline)
                        .foregroundColor(textColor) // Applying white text color
                    Text("Status Id: \(order.statusId)")
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

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
