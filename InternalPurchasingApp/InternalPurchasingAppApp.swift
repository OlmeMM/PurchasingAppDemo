//
//  InternalPurchasingAppApp.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/5/24.
//

import SwiftUI


@main
struct MyApp: App {
    @StateObject private var navigationViewModel = NavigationViewModel()

    var body: some Scene {
        WindowGroup {
            LaunchScreenView()
                .environmentObject(navigationViewModel)
        }
    }
}
