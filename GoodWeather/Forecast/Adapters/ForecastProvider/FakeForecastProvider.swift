//
//  FakeForecastProvider.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation
import Resolver
import Combine

final class FakeForecastProvider: ForecastProvider {
    
    private let fileName: String
    private let decoder: JSONDecoder
    @Injected
    var mapper: URLSessionForecastProviderMapper
    
    init(fileName: String = "data", decoder: JSONDecoder = JSONDecoder()) {
        self.fileName = fileName
        self.decoder = decoder
    }
   
    func getForecast(for city: String) -> AnyPublisher<Forecast, ForecastProviderError> {
        return map(forecast: Just(readData()))
    }
    
    func getForecast(for location: (Double, Double)) -> AnyPublisher<Forecast, ForecastProviderError> {
        return map(forecast: Just(readData()))
    }
    
    private func map(forecast: Just<Forecast>) -> AnyPublisher<Forecast, ForecastProviderError> {
        return forecast
            .setFailureType(to: ForecastProviderError.self)
            .eraseToAnyPublisher()
    }
    
    private func readData() -> Forecast {
        let data = readFile(withName: fileName)!
        let forecastDto = try! decoder.decode(ForecastDto.self, from: data)
        return mapper.toDomain(forecastDto: forecastDto)
    }
    
    private func readFile(withName name: String, ofType type: String = "json") -> Data? {
        guard let filePath = Bundle.main.path(forResource: name, ofType: type),
              let data = try? String(contentsOfFile: filePath).data(using: .utf8) else {
            return nil
        }
        return data
    }
    
}
