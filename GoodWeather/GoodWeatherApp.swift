//
//  GoodWeatherApp.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import SwiftUI
import Resolver

@main
struct GoodWeatherApp: App {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = .lightGray
    }
    
    @InjectedObservedObject
    var loginViewModel: LoginViewModel
    
    var body: some Scene {
        WindowGroup {
            if loginViewModel.isAuthenticated {
                TabView {
                    ForecastRouterView()
                        .environmentObject(ForecastRouter())
                        .tabItem {
                            Image(systemName: "sun.max.fill")
                            Text("Forecast")
                        }
                    FoodListView()
                        .tabItem {
                            Image(systemName: "list.dash")
                            Text("Menu")
                        }
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                }
                .accentColor(.accentColor)
            } else {
                LoginView(viewModel: loginViewModel)
            }
        }
    }
}
