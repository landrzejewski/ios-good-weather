//
//  ForecastResolver+ext.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

import Foundation
import Resolver

extension Resolver.Name {
    
    static let fake = Self("fake")
    
}

extension Resolver {
    
    static func registerForecastComponents() {
        register(name: .fake) { FakeForecastProvider() as ForecastProvider }
        
        register { URLSessionForecastProviderMapper() }
        register { URLSessionForecastProvider(url: "https://api.openweathermap.org/data/2.5/forecast/daily?cnt=7&units=metric&APPID=b933866e6489f58987b2898c89f542b8") }
        register { URLSessionForecastProviderAdapter() as ForecastProvider  }
    
        register { try? SqlForecastRepository() as ForecastQueries & ForecastUpdates }
        
        register { GetForecastService() }.implements(GetForecastUseCase.self)
        
        register { CoreLocationProvider() as LocationProvider }
        
        register { ForecastViewModelMapper() }
        
        register { ForecastViewModel() }
    }
    
}
