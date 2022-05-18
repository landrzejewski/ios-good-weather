//
//  ForecastProviderLoggerProxy.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

import Foundation
import Resolver
import Combine

final class ForecastProviderLoggerProxy: ForecastProvider {

    @Injected
    var provider: ForecastProvider
    @Injected
    var loggeer: Logger
    
    func getForecast(for city: String) -> AnyPublisher<Forecast, ForecastProviderError> {
        loggeer.log(level: .info, message: "Loading forecast for city \(city) from server")
        return provider.getForecast(for: city)
    }
    
    func getForecast(for location: (Double, Double)) -> AnyPublisher<Forecast, ForecastProviderError> {
        loggeer.log(level: .info, message: "Loading forecast for location \(location) from server")
        return provider.getForecast(for: location)
    }
    
}
