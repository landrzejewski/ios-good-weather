//
//  URLSessionForecastProviderAdapter.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

final class URLSessionForecastProviderAdapter: ForecastProvider {
    
    private let provider: URLSessionForecastProvider
    private let mapper: URLSessionForecastProviderMapper
    
    init(provider: URLSessionForecastProvider, mapper: URLSessionForecastProviderMapper) {
        self.provider = provider
        self.mapper = mapper
    }
   
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
