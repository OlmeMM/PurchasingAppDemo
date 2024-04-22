//
//  NavigationViewModel.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/19/24.
//
import SwiftUI

class NavigationViewModel: ObservableObject {
    @Published var selectedView: String = "HomeView"

    func navigate(to view: String) {
        selectedView = view
    }
}
