//
//  URLSessionForecastProvider.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation
import Combine

final class URLSessionForecastProvider {
    
    private let url: String
    private let decoder: JSONDecoder
    
    init(url: String, decoder: JSONDecoder = JSONDecoder()) {
        self.url = url
        self.decoder = decoder
    }
    
    func getForecast(for city: String) -> AnyPublisher<ForecastDto, URLSessionForecastProviderError> {
        return getForecast(requestURL: "\(url)&q=\(city)")
    }
    
    func getForecast(for location: (Double, Double)) -> AnyPublisher<ForecastDto, URLSessionForecastProviderError> {
        return getForecast(requestURL: "\(url)&lon=\(location.0)&lat=\(location.1)")
    }
    
    private func getForecast(requestURL: String) -> AnyPublisher<ForecastDto, URLSessionForecastProviderError> {
        guard let url = URL(string: requestURL) else {
            return Fail(error: URLSessionForecastProviderError.invalidRequestUrl).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { URLSessionForecastProviderError.requestFailed($0.errorCode) }
            .map { $0.data }
            .decode(type: ForecastDto.self, decoder: decoder)
            .mapError { URLSessionForecastProviderError.parsingFailed($0.localizedDescription) }
            .eraseToAnyPublisher()
    }
    
}
