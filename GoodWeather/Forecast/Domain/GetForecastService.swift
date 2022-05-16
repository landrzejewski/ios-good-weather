//
//  GetForecastService.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

final class GetForecastService: GetForecastUseCase {

    private let forecastProvider: ForecastProvider
    private let forecastRepository: ForecastQueries & ForecastUpdates
    
    init(forecastProvider: ForecastProvider, forecastRepository: ForecastQueries & ForecastUpdates) {
        self.forecastProvider = forecastProvider
        self.forecastRepository = forecastRepository
    }
    
    func getForecast(for city: String, callback: @escaping (Result<Forecast, GetForecastError>) -> ()) {
        forecastRepository.getAll(for: city) { cachedForecast in
            if !cachedForecast.isEmpty {
                callback(.success(Forecast(city: city, forecast: cachedForecast)))
            }
        }
        forecastProvider.getForecast(for: city) { self.onForecastLoaded(result: $0, callback: callback) }
    }
    
    func getForecast(for location: (Double, Double), callback: @escaping (Result<Forecast, GetForecastError>) -> ()) {
        forecastProvider.getForecast(for: location) { self.onForecastLoaded(result: $0, callback: callback) }
    }
        
    private func onForecastLoaded(result: Result<Forecast, ForecastProviderError>, callback: @escaping (Result<Forecast, GetForecastError>) -> ()) {
        switch result {
        case .success(let data):
            forecastRepository.deleteAll()
            do {
                try forecastRepository.save(forecast: data.forecast, for: data.city)
                callback(.success(data))
            }  catch {
                callback(.failure(.saveForecastFailed))
            }
        case .failure(_):
            callback(.failure(.getForecastFailed))
        }
    }
    
}
