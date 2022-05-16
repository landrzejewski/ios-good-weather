//
//  FakeForecastRepository.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

final class FakeForecastReposiory: ForecastQueries, ForecastUpdates {
    
    private var data: [UUID:DayForecast] = [:]
   
    func getBy(id: UUID, callback: @escaping (DayForecast?) -> ()) {
        callback(data[id])
    }
    
    func getAll(for city: String, callback: @escaping ([DayForecast]) -> ()) {
        callback(Array(data.values))
    }
    
    func save(forecast: [DayForecast], for city: String) throws {
        forecast.forEach { dayForecast in
            data[UUID()] = dayForecast
        }
    }
    
    func deleteAll() {
        data.removeAll()
    }
    
}
