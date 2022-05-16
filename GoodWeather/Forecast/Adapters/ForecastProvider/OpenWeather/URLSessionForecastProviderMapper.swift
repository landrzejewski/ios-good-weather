//
//  URLSessionForecastProviderMapper.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

final class URLSessionForecastProviderMapper {
    
    private let icons = ["01d": "sun.max.fill", "02d": "cloud.sun.fill", "03d": "cloud.fill", "04d": "smoke.fill", "09d": "cloud.rain.fill", "10d": "cloud.sun.rain.fill", "11d": "cloud.sun.bolt.fill", "13d": "snow", "50d": "cloud.fog.fill"]
    
    func toDomain(forecastDto: ForecastDto) ->  Forecast {
        let cityName = forecastDto.city.name
        let city = cityName.isEmpty ? "Current location" : cityName
        return Forecast(city: city, forecast: forecastDto.forecast.map(toDomain(dayForecastDto:)))
    }
    
    private func toDomain(dayForecastDto: DayForecastDto) -> DayForecast {
        let id = dayForecastDto.id
        let date = Date(timeIntervalSince1970: dayForecastDto.date)
        let temperature = dayForecastDto.temperature.day
        let pressure = dayForecastDto.pressure
        let conditions = dayForecastDto.conditions.first
        let icon = icons[conditions?.icon ?? ""] ?? "xmark.circle"
        let description = conditions?.description ?? ""
        return DayForecast(id: id, date: date, temperature: temperature, pressure: pressure, icon: icon, description: description)
    }
    
}
