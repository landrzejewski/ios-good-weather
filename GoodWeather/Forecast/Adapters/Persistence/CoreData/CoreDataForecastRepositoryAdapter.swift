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
    private var repostory: CoreDataForecastRepository
    @Injected
    private var mapper: CoreDataForecastRepositoryMapper
    
    func getBy(id: UUID, callback: @escaping (DayForecast?) -> ()) {
        repostory.getBy(id: id) { dayForecastEntity in
            callback(dayForecastEntity.map(self.mapper.toDomain))
        }
    }
    
    func getAll(for city: String, callback: @escaping ([DayForecast]) -> ()) {
        repostory.getAll(for: city) { forecast in
            callback(Array<DayForecastEntity>(forecast)
                .map(self.mapper.toDomain)
                .sorted { $0.date < $1.date })
        }
    }
    
    func save(forecast: [DayForecast], for city: String) throws {
        
    }
    
    func deleteAll() {
        
    }
    
}
