//
//  OrderView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//


import SwiftUI
import Alamofire
 
struct OrderView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var internalOrders: [InternalOrder] = []
    // Function to fetch internal orders
    
    
    func fetchInternalOrder(apiUrl: String, completion: @escaping ([InternalOrder]) -> Void) {
        AF.request("\(apiUrl)InternalOrder/getALL").response { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let internalOrder = try JSONDecoder().decode([InternalOrder].self, from: data)
                        completion(internalOrder) // Call completion with fetched data
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
                    .foregroundColor(.blue)
                })
                .navigationBarTitle("Orders", displayMode: .inline)
                .navigationBarHidden(true)
            }
        }
    
    
    
 
    

        private func internalOrderView(order: InternalOrder) -> some View {

            VStack {

                HStack {

                    VStack(alignment: .leading, spacing: 5) {

                        Text("\(order.notes)")

                            .font(.headline)

                        Text(DateFormatter().string(from: order.deliveryDate))

                            .font(.subheadline)

                            .foregroundColor(.secondary)

                    }

                    VStack(alignment: .leading, spacing: 5) {

                        Text("\(order.totalAmount)")

                            .font(.headline)

                        Text("\(order.statusId)")

                            .font(.subheadline)

                            .foregroundColor(.secondary)

                    }

                    Spacer()

                   

                        .font(.headline)

                        .foregroundColor(.primary)

                }

                .padding()

                .background(Color.gray.opacity(0.1))

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
