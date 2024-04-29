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
    //replace this with Http request return value//
    let recentOrders = [
        ("Daniel Wellington Classic", "John Doe - Stripe", "#51202325", "$149.21", "Apr 28"),
        ("Skater Dress", "Adele Camp - Square", "#645644", "$260", "Apr 27"),
        ("Woodland Shoes", "Beverly Alen - Paypal", "#51202563", "$94.54", "Apr 23"),
        ("Test 1", "Beverly Alen - Payherf", "#51204343", "$23.50", "Feb 21")
    ]
    
    
    
    private func internalOrderView(order: InternalOrder) -> some View {
        VStack {
            // Customize the view to display the PlacedInternalOrder
            Text("\(order.totalAmount)")
                .font(.headline)
            // Add more views to display other properties if needed
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal)
    }
    
    
    func fetchInternalOrder(completion: @escaping ([InternalOrder]?) -> Void) {
        AF.request("https://7c1f-2603-6080-8f01-5295-b011-7537-c673-c88a.ngrok-free.app/internalOrder/getAll").response { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let internalOrder = try JSONDecoder().decode([InternalOrder].self, from: data)
                        completion(internalOrder) // Call completion with fetched data
                    } catch let error as NSError {
                        print(error)
                        completion(nil) // Call completion with nil in case of error
                    }
                }
            case .failure(let error):
                print("Error:", error)
                completion(nil) // Call completion with nil in case of failure
            }
        }
    }
    
    var body: some View {
        ZStack {
            mainContent
                .blur(radius: isShowingSideMenu ? 20 : 0)
                .animation(.easeInOut, value: isShowingSideMenu)
                .disabled(isShowingSideMenu)
            // Side Menu layer
            if isShowingSideMenu {
                sideMenu
            }
        }
        .navigationBarItems(leading: menuButton)
        .navigationBarTitleDisplayMode(.inline)
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(true) // Add this line
    }
    
    private var mainContent: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
                    .padding([.horizontal, .top])
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(alignment: .leading, spacing: 20) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 60) {
                        ForEach(dashboardIcons.indices, id: \.self) { index in
                            NavigationLink(destination: dashboardIconsNavg[index]) {
                                VStack {
                                    Image(systemName: dashboardIcons[index].1)
                                        .font(.title)
                                        .foregroundColor(primaryColor)
                                        .padding()
                                        .background(lightBackgroundColor)
                                        .clipShape(Circle())
                                    Text(dashboardIcons[index].0)
                                        .font(.caption)
                                        .foregroundColor(textColor)
                                }
                                .frame(width: 80, height: 100)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                
                .background(backgroundColor)
            }
        }
        
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

