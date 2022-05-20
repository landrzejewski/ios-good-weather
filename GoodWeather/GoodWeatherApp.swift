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
    
    @Injected
    var foodListViewModel: FoodListViewModel
    @Injected
    var profileViewModel: ProfileViewModel
    @Injected
    var loginViewModel: LoginViewModel
    
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel())
//            TabView {
//                ForecastRouterView()
//                    .environmentObject(ForecastRouter())
//                    .tabItem {
//                        Image(systemName: "sun.max.fill")
//                        Text("Forecast")
//                    }
//                FoodListView(viewModel: foodListViewModel)
//                    .tabItem {
//                        Image(systemName: "list.dash")
//                        Text("Menu")
//                    }
//                ProfileView(viewModel: profileViewModel)
//                    .tabItem {
//                        Image(systemName: "person")
//                        Text("Profile")
//                    }
//            }
//            .accentColor(.accentColor)
        }
    }
}
