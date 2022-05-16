//
//  DayForecastDto.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

struct DayForecastDto: Decodable {
    
    let date: Double
    let temperature: TemperatureDto
    let pressure: Double
    let conditions: [ConditionsDto]
    
    enum CondingKeys: String, CodingKey {
        
        case date = "dt"
        case temperature = "temp"
        case pressure
        case conditions = "weather"
        
    }
    
}
