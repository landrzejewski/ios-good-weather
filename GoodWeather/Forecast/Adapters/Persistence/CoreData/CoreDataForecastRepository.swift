//
//  CoreDataForecastRepository.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

import Foundation
import Resolver
import CoreData

final class CoreDataForecastRepository {
    
    @Injected
    var stack: CoreDataStack
    private var forecastAsyncRequest: NSAsynchronousFetchRequest<DayForecastEntity>?
    private var cityAsyncRequest: NSAsynchronousFetchRequest<CityEntity>?
    
    func getBy(id: UUID, callback: @escaping (DayForecastEntity?) -> ()) {
        let request = DayForecastEntity.fetchRequest()
        request.predicate = NSPredicate(format: "%K = %@", argumentArray: [#keyPath(DayForecastEntity.forecastId), id])
        forecastAsyncRequest = NSAsynchronousFetchRequest(fetchRequest: request) { result in
            guard let dayForecast = result.finalResult?.first else {
                callback(nil)
                return
            }
            callback(dayForecast)
        }
        _ = try? stack.context.execute(forecastAsyncRequest!)
    }
    
    func getAll(for city: String, callback: @escaping (Set<DayForecastEntity>) -> ()) {
        let request = CityEntity.fetchRequest()
        request.predicate = NSPredicate(format: "%K = %@", argumentArray: [#keyPath(CityEntity.name), city])
        cityAsyncRequest = NSAsynchronousFetchRequest(fetchRequest: request) { result in
            guard let city = result.finalResult?.first, let forecast = city.forecast as? Set<DayForecastEntity> else {
                callback([])
                return
            }
            callback(forecast)
        }
        _ = try? stack.context.execute(cityAsyncRequest!)
    }
    
    func save(city: CityEntity) throws {
        try stack.context.save()
    }
    
    func deleteAll() {
        let request = CityEntity.fetchRequest()
        cityAsyncRequest = NSAsynchronousFetchRequest(fetchRequest: request) { result in
            result.finalResult?.forEach { city in
                self.stack.context.delete(city)
            }
        }
    }
    
}
