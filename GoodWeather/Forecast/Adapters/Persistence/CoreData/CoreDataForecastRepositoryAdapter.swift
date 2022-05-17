//
//  CoreDataForecastRepositoryAdapter.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

import Foundation
import Resolver

final class CoreDataForecastRepositoryAdapter: ForecastQueries, ForecastUpdates {
  
    @Injected
    var repostory: CoreDataForecastRepository
    @Injected
    var mapper: CoreDataForecastRepositoryMapper
    
    func getBy(id: UUID, callback: @escaping (DayForecast?) -> ()) {
        repostory.getBy(id: id) {
            callback($0.map(self.mapper.toDomain))
        }
    }
    
    func getAll(for city: String, callback: @escaping ([DayForecast]) -> ()) {
        repostory.getAll(for: city) {
            callback(Array($0).map(self.mapper.toDomain).sorted { $0.date < $1.date })
        }
    }
    
    func save(forecast: [DayForecast], for city: String) throws {
        try repostory.save(city: self.mapper.toEntity(city: city, forecast: forecast))
    }
    
    func deleteAll() {
        repostory.deleteAll()
    }
    
}
