//
//  SqlForecastRepository.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

import Foundation
import SQLite

final class SqlForecastRepository: ForecastQueries, ForecastUpdates {
    
    private let db: Connection
    private let forecastTable = Table("forecast")
    private let id = Expression<String>("id")
    private let date = Expression<Date>("date")
    private let temperature = Expression<Double>("temperature")
    private let pressure = Expression<Double>("pressure")
    private let icon = Expression<String>("icon")
    private let description = Expression<String>("description")
    private let city = Expression<String>("city")
   
    // https://github.com/garriguv/SQLiteMigrationManager.swift
    init(dbName: String = "forecast.db") throws {
        let dbPath = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent(dbName)
            .path
        db = try Connection(dbPath)
        try db.run(forecastTable.create(ifNotExists: true) { table in
            table.column(id, primaryKey: true)
            table.column(date)
            table.column(temperature)
            table.column(pressure)
            table.column(icon)
            table.column(description)
            table.column(city)
        })
    }
    
    func getBy(id: UUID, callback: @escaping (DayForecast?) -> ()) {
        guard let row = try? db.pluck(forecastTable.filter(id.uuidString == self.id)) else {
            callback(nil)
            return
        }
        callback(toDomain(row: row))
    }
    
    func getAll(for city: String, callback: @escaping ([DayForecast]) -> ()) {
        guard let rows = try? db.prepare(forecastTable.filter(city == self.city)) else {
            callback([])
            return
        }
        callback(rows.map(toDomain))
    }
    
    func save(forecast: [DayForecast], for city: String) throws {
        try forecast.forEach { dayForecast in
            let insert = forecastTable.insert(
                id <- dayForecast.id.uuidString,
                date <- dayForecast.date,
                temperature <- dayForecast.temperature,
                pressure <- dayForecast.pressure,
                icon <- dayForecast.icon,
                description <- dayForecast.description,
                self.city <- city
            )
            try db.run(insert)
        }
    }
    
    func deleteAll() {
       _ = try? db.run(forecastTable.delete())
    }
    
    private func toDomain(row: Row) -> DayForecast {
        let id = UUID(uuidString: row[id]) ?? UUID()
        return DayForecast(id: id, date: row[date], temperature: row[temperature], pressure: row[pressure], icon: row[icon], description: row[description])
    }
    
}
