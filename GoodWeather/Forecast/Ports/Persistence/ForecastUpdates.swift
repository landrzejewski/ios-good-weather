//
//  ForecastUpdates.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

protocol ForecastUpdates {
    
    func save(forecast: [DayForecast], for city: String) throws
    
    func deleteAll()
    
}
