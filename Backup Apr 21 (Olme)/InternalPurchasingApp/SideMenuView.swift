//
//  SideMenuView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI


struct SideMenuView: View {
    @Binding var isShowingSideMenu: Bool
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.black.opacity(0.5))
            .opacity(isShowingSideMenu ? 1 : 0)
            .animation(.easeInOut(duration: 0.5), value: isShowingSideMenu)
            .onTapGesture {
                withAnimation {
                    isShowingSideMenu = false
                }
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    // Side menu content goes here...
                    // Place buttons or links to different parts of your app
                    Group {
                        SideMenuButton(text: "Home", iconName: "house", isSelected: true) {
                            // Action for Home
                        }
                        SideMenuButton(text: "Dashboard", iconName: "speedometer") {
                            // Action for Dashboard
                        }
                        SideMenuButton(text: "Orders", iconName: "list.bullet") {
                            // Action for Orders
                        }
                        SideMenuButton(text: "Notifications", iconName: "bell") {
                            // Action for Notifications
                        }
                        SideMenuButton(text: "Activity", iconName: "person.3") {
                            // Action for Activity
                        }
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .frame(width: 250)
                .background(Color (hex: "#ad8d49"))
                .offset(x: isShowingSideMenu ? 0 : -250)
                .transition(.move(edge: .leading))
                .animation(.easeInOut(duration: 0.5), value: isShowingSideMenu)
                
                Spacer()
            }
        }
    }
}

struct SideMenuButton: View {
    let text: String
    let iconName: String
    var isSelected: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(isSelected ? .blue : .gray)
                    .imageScale(.large)
                    .frame(width: 24, height: 24)
                Text(text)
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .semibold))
                
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(isSelected ? Color.blue.opacity(0.2) : Color.clear)
            .cornerRadius(8)
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowingSideMenu: .constant(true))
    }
}
