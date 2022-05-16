//
//  DayForecastDto.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

struct DayForecastDto: Decodable {
    
    let id = UUID()
    let date: Double
    let temperature: TemperatureDto
    let pressure: Double
    let conditions: [ConditionsDto]
    
    enum CodingKeys: String, CodingKey {
        
        case date = "dt"
        case temperature = "temp"
        case pressure
        case conditions = "weather"
        
    }
    
}
