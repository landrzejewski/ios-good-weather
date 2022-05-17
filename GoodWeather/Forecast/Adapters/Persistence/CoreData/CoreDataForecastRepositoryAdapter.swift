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
        
    }
    
    func getAll(for city: String, callback: @escaping ([DayForecast]) -> ()) {
        
    }
    
    func save(forecast: [DayForecast], for city: String) throws {
        
    }
    
    func deleteAll() {
        
    }
    
}
