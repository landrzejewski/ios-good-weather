//
//  FakeForecastProvider.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

final class FakeForecastProvider: ForecastProvider {
    
    private let forecast = [
        DayForecast(date: Date(), temperature: 18.0, pressure: 1000.0, icon: "sun.max.fill", description: "Clear sky"),
        DayForecast(date: Date(), temperature: 22.0, pressure: 1001.0, icon: "cloud.fill", description: "Clear sky"),
        DayForecast(date: Date(), temperature: 14.0, pressure: 1005.0, icon: "smoke.fill", description: "Clear sky"),
        DayForecast(date: Date(), temperature: 16.0, pressure: 1015.0, icon: "cloud.rain.fill", description: "Clear sky"),
        DayForecast(date: Date(), temperature: 21.0, pressure: 999.0, icon: "cloud.fill", description: "Clear sky")
    ]
   
    func getForecast(for city: String, callback: @escaping (Result<Forecast, ForecastProviderError>) -> ()) {
        callback(.success(Forecast(city: city, forecast: forecast)))
    }
    
    func getForecast(for location: (Double, Double), callback: @escaping (Result<Forecast, ForecastProviderError>) -> ()) {
        callback(.success(Forecast(city: "Warsaw", forecast: forecast)))
    }
    
}
