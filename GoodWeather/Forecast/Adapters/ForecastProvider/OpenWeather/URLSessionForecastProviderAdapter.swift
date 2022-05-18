//
//  URLSessionForecastProviderAdapter.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation
import Resolver
import Combine

final class URLSessionForecastProviderAdapter: ForecastProvider {
    
    @Injected
    var provider: URLSessionForecastProvider
    @Injected
    var mapper: URLSessionForecastProviderMapper
   
    func getForecast(for city: String) -> AnyPublisher<Forecast, ForecastProviderError> {
        return map(forecast: provider.getForecast(for: city))
    }
    
    func getForecast(for location: (Double, Double)) -> AnyPublisher<Forecast, ForecastProviderError> {
        return map(forecast: provider.getForecast(for: location))
    }
    
    private func map(forecast: AnyPublisher<ForecastDto, URLSessionForecastProviderError>) -> AnyPublisher<Forecast, ForecastProviderError> {
        return forecast.map(mapper.toDomain)
            .mapError { _ in ForecastProviderError.getForecastFailed }
            .eraseToAnyPublisher()
    }
    
}
