//
//  NavigationViewModel2.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/21/24.
//

import SwiftUI

class NavigationViewModel: ObservableObject {
    @Published var selectedView: String = "HomeView"

    func navigate(to view: String) {
        selectedView = view
    }
}
