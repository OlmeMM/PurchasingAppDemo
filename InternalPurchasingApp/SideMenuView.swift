//
//  SideMenuView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/14/24.
//

import SwiftUI


struct SideMenuView: View {
    @Binding var isShowingSideMenu: Bool
    @EnvironmentObject var navigationViewModel: NavigationViewModel
    
    let backgroundColor = Color(hex: "ad8d49") // Dark gold for the side menu background
    let buttonTextColor = Color(hex: "c2a25d") // Gold color for button text
    let selectedButtonColor = Color(hex: "c2a25d") // Gold color for selected button background
    let buttonIconColor = Color(hex: "053426") // Dark green for icons
    
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
                    Group {
                        SideMenuButton(
                            text: "Dashboard",
                            iconName: "speedometer",
                            textColor: buttonIconColor,
                            iconColor: buttonIconColor,
                            selectedButtonColor: buttonIconColor,
                            isSelected: false
                        ) {
                            navigationViewModel.navigate(to: "DashboardView")
                        }
                        SideMenuButton(
                            text: "Home",
                            iconName: "house",
                            textColor: buttonIconColor,
                            iconColor: buttonIconColor,
                            selectedButtonColor: buttonIconColor,
                            isSelected: false
                        ) {
                            navigationViewModel.navigate(to: "HomeView")
                        }
                        SideMenuButton(
                            text: "Notifications",
                            iconName: "bell",
                            textColor: buttonIconColor,
                            iconColor: buttonIconColor,
                            selectedButtonColor: buttonIconColor,
                            isSelected: true
                        ) {
                            navigationViewModel.navigate(to: "NotificationsView")
                                                   
                        }
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .frame(width: 250)
                .background(backgroundColor)
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
    let textColor: Color
    let iconColor: Color
    let selectedButtonColor: Color
    var isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(isSelected ? iconColor : textColor)
                    .imageScale(.large)
                    .frame(width: 24, height: 24)
                Text(text)
                    .foregroundColor(textColor)
                    .font(.system(size: 17, weight: .semibold))
                
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(isSelected ? selectedButtonColor.opacity(0.2) : Color.clear)
            .cornerRadius(8)
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowingSideMenu: .constant(true)).environmentObject(NavigationViewModel())
    }
}
