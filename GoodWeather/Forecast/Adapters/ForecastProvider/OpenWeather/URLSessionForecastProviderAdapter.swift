//
//  URLSessionForecastProviderAdapter.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation
import Resolver

final class URLSessionForecastProviderAdapter: ForecastProvider {
    
    @Injected
    var provider: URLSessionForecastProvider
    @Injected
    var mapper: URLSessionForecastProviderMapper
   
    func getForecast(for city: String, callback: @escaping (Result<Forecast, ForecastProviderError>) -> ()) {
        provider.getForecast(for: city) { result in
            switch result {
            case .success(let data):
                let forecast = self.mapper.toDomain(forecastDto: data)
                callback(.success(forecast))
            case .failure(_):
                callback(.failure(.getForecastFailed))
            }
        }
    }
    
    func getForecast(for location: (Double, Double), callback: @escaping (Result<Forecast, ForecastProviderError>) -> ()) {
        provider.getForecast(for: location) { result in
            switch result {
            case .success(let data):
                let forecast = self.mapper.toDomain(forecastDto: data)
                callback(.success(forecast))
            case .failure(_):
                callback(.failure(.getForecastFailed))
            }
        }
    }
    
}
