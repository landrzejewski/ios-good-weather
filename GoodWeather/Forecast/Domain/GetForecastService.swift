//
//  GetForecastService.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation
import Resolver
import Combine

final class GetForecastService: GetForecastUseCase {
    
    @Injected(name: .proxy)
    private var forecastProvider: ForecastProvider
    @Injected
    private var forecastRepository: ForecastQueries & ForecastUpdates
    private var cancellable = Set<AnyCancellable>()
    
    func getForecast(for city: String) -> AnyPublisher<Forecast, GetForecastError> {
        let forecast = PassthroughSubject<Forecast, GetForecastError>()
        forecastRepository.getAll(for: city) { forecast.send(Forecast(city: city, forecast: $0)) }
        map(input: forecastProvider.getForecast(for: city), output: forecast)
        return forecast.eraseToAnyPublisher()
    }
    
    func getForecast(for location: (Double, Double)) -> AnyPublisher<Forecast, GetForecastError> {
        let forecast = PassthroughSubject<Forecast, GetForecastError>()
        map(input: forecastProvider.getForecast(for: location), output: forecast)
        return forecast.eraseToAnyPublisher()
    }
    
    private func map(input: AnyPublisher<Forecast, ForecastProviderError>, output: PassthroughSubject<Forecast, GetForecastError>) {
        input.mapError { _ in GetForecastError.getForecastFailed }
            .sink(receiveCompletion: { _ in }) {
                self.forecastRepository.deleteAll()
                do {
                    try self.forecastRepository.save(forecast: $0.forecast, for: $0.city)
                    output.send($0)
                } catch {
                    output.send(completion: .failure(GetForecastError.saveForecastFailed))
                }
            }
            .store(in: &cancellable)
    }
    
}
