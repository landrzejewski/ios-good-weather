//
//  CoreDataForecastRepositoryMapper.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

import Foundation

final class CoreDataForecastRepositoryMapper {
    
    func toDomain(dayForecastEntity: DayForecastEntity) -> DayForecast {
        let id = dayForecastEntity.forecastId
        let date = dayForecastEntity.date
        let temperature = dayForecastEntity.temperature
        let pressure = dayForecastEntity.pressure
        let icon = dayForecastEntity.imageName
        let description = dayForecastEntity.conditions
        return DayForecast(id: id, date: date, temperature: temperature, pressure: pressure, icon: icon, description: description)
    }
    
}
