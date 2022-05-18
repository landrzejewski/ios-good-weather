//
//  URLSessionForecastProvider.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

final class URLSessionForecastProvider {
    
    private let url: String
    private let decoder: JSONDecoder
    
    init(url: String, decoder: JSONDecoder = JSONDecoder()) {
        self.url = url
        self.decoder = decoder
    }
    
    func getForecast(for city: String, callback: @escaping (Result<ForecastDto, URLSessionForecastProviderError>) -> ()) {
        getForecast(requestURL: "\(url)&q=\(city)", callback: callback)
    }
    
    func getForecast(for location: (Double, Double), callback: @escaping (Result<ForecastDto, URLSessionForecastProviderError>) -> ()) {
        getForecast(requestURL: "\(url)&lon=\(location.0)&lat=\(location.1)", callback: callback)
    }
    
    private func getForecast(requestURL: String, callback: @escaping (Result<ForecastDto, URLSessionForecastProviderError>) -> ()) {
        guard let url = URL(string: requestURL) else {
            callback(.failure(.invalidRequestUrl))
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { text, response, error in
            if let error = error {
                callback(.failure(.error(error.localizedDescription)))
                return
            }
            let responseStatus = (response as? HTTPURLResponse)?.statusCode ?? -1
            guard (200...299).contains(responseStatus) else {
                callback(.failure(.requestFailed(responseStatus)))
                return
            }
            guard let json = text else {
                callback(.failure(.invalidResponseData))
                return
            }
            do {
                let forecast = try self.decoder.decode(ForecastDto.self, from: json)
                callback(.success(forecast))
            } catch {
                print(error)
                callback(.failure(.parsingFailed(error.localizedDescription)))
            }
        }
        .resume()
    }
    
}
