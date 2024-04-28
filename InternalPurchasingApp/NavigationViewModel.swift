//
//  NavigationViewModel.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/21/24.
//
 
import SwiftUI
 
class NavigationViewModel: ObservableObject {
    enum Destination {
        case home, orders // Removed dashboard
    }
    
    @Published var currentView: Destination?
    
    var isHomePresented: Bool {
        get { return currentView == .home }
        set { if newValue { currentView = .home } else { currentView = nil } }
    }
    
    var isOrdersPresented: Bool {
        get { return currentView == .orders }
        set { if newValue { currentView = .orders } else { currentView = nil } }
    }
}

class NavigationViewModelOld: ObservableObject {
    enum ViewType: String {
        case home = "HomeView"
        case dashboard = "DashboardView"
        case orders = "OrderView"
    }
 
    @Published var selectedView: ViewType = .home
 
    func navigate(to view: ViewType) {
        print("Navigating to \(view)")
        selectedView = view
    }
}
