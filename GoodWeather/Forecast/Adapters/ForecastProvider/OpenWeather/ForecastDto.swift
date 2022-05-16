//
//  ForecastDto.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

struct ForecastDto: Decodable {
    
    let city: CityDto
    let forecast: [DayForecastDto]
    
    enum CondingKeys: String, CodingKey {
        
        case city
        case forecast = "list"
        
    }
    
}
