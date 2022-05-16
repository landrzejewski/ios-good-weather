//
//  DayForecast.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

struct DayForecast {
    
    let id: UUID
    let date: Date
    let temperature: Double
    let pressure: Double
    let icon: String
    let description: String
    
}
