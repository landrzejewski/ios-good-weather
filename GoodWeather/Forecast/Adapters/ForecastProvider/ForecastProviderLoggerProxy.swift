//
//  ForecastProviderLoggerProxy.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

import Foundation
import Resolver

final class ForecastProviderLoggerProxy: ForecastProvider {

    @Injected
    var provider: ForecastProvider
    @Injected
    var loggeer: Logger
    
    func getForecast(for city: String, callback: @escaping (Result<Forecast, ForecastProviderError>) -> ()) {
        loggeer.log(level: .info, message: "Loading forecast for city \(city) from server")
        provider.getForecast(for: city, callback: callback)
    }
    
    func getForecast(for location: (Double, Double), callback: @escaping (Result<Forecast, ForecastProviderError>) -> ()) {
        loggeer.log(level: .info, message: "Loading forecast for location \(location) from server")
        provider.getForecast(for: location, callback: callback)
    }
    
}
