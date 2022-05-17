//
//  CoreDataForecastRepositoryMapper.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

import Foundation
import Resolver
import CoreData

final class CoreDataForecastRepositoryMapper {
    
    @Injected
    var stack: CoreDataStack
    
    func toDomain(dayForecastEntity: DayForecastEntity) -> DayForecast {
        let id = dayForecastEntity.forecastId
        let date = dayForecastEntity.date
        let temperature = dayForecastEntity.temperature
        let pressure = dayForecastEntity.pressure
        let icon = dayForecastEntity.imageName
        let description = dayForecastEntity.conditions
        return DayForecast(id: id, date: date, temperature: temperature, pressure: pressure, icon: icon, description: description)
    }
    
    func toEntity(city: String, forecast: [DayForecast]) -> CityEntity {
        // let cityEntity = NSEntityDescription.insertNewObject(forEntityName: "CityEntity", into: stack.context) as! CityEntity
        let cityEntity = CityEntity(context: stack.context)
        cityEntity.cityId = UUID()
        cityEntity.name = city
        cityEntity.forecast = NSSet(array: forecast.map(toEntity))
        return cityEntity
    }
    
    func toEntity(dayForecast: DayForecast) -> DayForecastEntity {
        let dayForecastEnity = DayForecastEntity(context: stack.context)
        dayForecastEnity.forecastId = dayForecast.id
        dayForecastEnity.date = dayForecast.date
        dayForecastEnity.temperature = dayForecast.temperature
        dayForecastEnity.pressure = dayForecast.pressure
        dayForecastEnity.conditions = dayForecast.description
        dayForecastEnity.imageName = dayForecast.icon
        return dayForecastEnity
    }
    
}
