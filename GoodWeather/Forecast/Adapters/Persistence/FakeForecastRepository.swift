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
        callback(Array(data.values).sorted(by:  { $0.date.compare($1.date) == .orderedAscending }))
    }
    
    func save(forecast: [DayForecast], for city: String) throws {
        forecast.forEach { dayForecast in
            data[dayForecast.id] = dayForecast
        }
    }
    
    func deleteAll() {
        data.removeAll()
    }
    
}
