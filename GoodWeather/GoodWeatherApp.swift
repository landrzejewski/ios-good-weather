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
    
    @Injected
    private var profileViewModel: ProfileViewModel
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ForecastRouterView()
                    .environmentObject(ForecastRouter())
                    .tabItem {
                        Image(systemName: "sun.max.fill")
                        Text("Forecast")
                    }
                ProfileView(viewModel: profileViewModel)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }
        }
    }
}
