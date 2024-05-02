//
//  HomeView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI
import Alamofire



struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedFilter = "All" // Initial filter selection
    @State private var isShowingSideMenu = false // State to control the side menu visibility
    @State private var internalOrders: [InternalOrder] = []

    // Colors defined
    let primaryColor = Color(hex: "c2a25d")
    let backgroundColor = Color(hex: "053426")
    let lightBackgroundColor = Color(hex: "38785e")
    let textColor = Color(hex: "FFFFFF")
    let subtitleTextColor = Color(hex: "BFBFBF")

    let dashboardIcons = [
        ("Orders", "cart.fill"),
        ("Products", "bag.fill")
    ]

    let dashboardIconsNavg: [AnyView] = [
        AnyView(OrderView()),
        AnyView(ProductsView())
    ]

    private func internalOrderView(order: InternalOrder) -> some View {
        VStack {
            Text("Total Amount: \(String(format: "%.2f", order.totalAmount))")
                .font(.headline)
                .foregroundColor(textColor) // Applying primary text color
            Text("Notes : \(order.notes)")
                .font(.headline)
                .foregroundColor(subtitleTextColor) // Applying secondary text color
            Text("Status Id: \(order.statusId)")
                .font(.headline)
                .foregroundColor(textColor) // Applying primary text color
        }
        .padding()
        .background(lightBackgroundColor) // Applying light background color
        .cornerRadius(10)
        .padding(.horizontal)
    }

    func fetchInternalOrder(completion: @escaping ([InternalOrder]) -> Void) {
          AF.request("https://7c1f-2603-6080-8f01-5295-b011-7537-c673-c88a.ngrok-free.app/internalOrder/getAll").response { response in
              switch response.result {
              case .success:
                  if let data = response.data {
                      do {
                          print("datafromserver: ",data)
                          
                          let internalOrder = try JSONDecoder().decode([InternalOrder].self, from: data)
                          print(internalOrder)
                          
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
        ZStack {
            mainContent
                .blur(radius: isShowingSideMenu ? 20 : 0)
                .animation(.easeInOut, value: isShowingSideMenu)
                .disabled(isShowingSideMenu)
            
            if isShowingSideMenu {
                sideMenu
            }
        }
        .navigationBarItems(leading: menuButton)
        .navigationBarTitleDisplayMode(.inline)
        .background(backgroundColor.edgesIgnoringSafeArea(.all)) // Apply main background color
        .navigationBarBackButtonHidden(true)
    }

    private var mainContent: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(textColor) // Applying text color
                    .padding([.horizontal, .top])
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 60) {
                    ForEach(dashboardIcons.indices, id: \.self) { index in
                        NavigationLink(destination: dashboardIconsNavg[index]) {
                            VStack {
                                Image(systemName: dashboardIcons[index].1)
                                    .font(.title)
                                    .foregroundColor(primaryColor) // Icon color
                                    .padding()
                                    .background(lightBackgroundColor) // Light background for icon
                                    .clipShape(Circle())
                                Text(dashboardIcons[index].0)
                                    .font(.caption)
                                    .foregroundColor(textColor) // Text color
                            }
                            .frame(width: 80, height: 100)
                        }
                    }
                }
                .padding(.horizontal)
            }

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
        .background(backgroundColor) // Main background color
    }

    private var sideMenu: some View {
        GeometryReader { _ in
            HStack {
                SideMenuView(isShowingSideMenu: $isShowingSideMenu)
                    .frame(width: 250)
                    .transition(.move(edge: .leading))
                Spacer()
            }
        }
        .background(Color.black.opacity(0.5).onTapGesture {
            withAnimation {
                isShowingSideMenu = false
            }
        })
    }

    private var menuButton: some View {
        Button(action: {
            withAnimation {
                isShowingSideMenu.toggle()
            }
        }) {
            Image(systemName: "line.horizontal.3")
                .foregroundColor(textColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
