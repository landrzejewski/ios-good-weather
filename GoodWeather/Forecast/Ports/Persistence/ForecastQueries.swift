//
//  ForecastQueries.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

protocol ForecastQueries {
    
    func getBy(id: UUID, callback: @escaping (DayForecast?) -> ())
    
    func getAll(for city: String, callback: @escaping ([DayForecast]) -> ())
    
}
