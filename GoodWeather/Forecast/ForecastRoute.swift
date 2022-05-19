//
//  ForecastRoute.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

enum ForecastRoute: Equatable {

    case forecast
    case forecastDetails(DayForecastViewModel)

    static func == (lhs: ForecastRoute, rhs: ForecastRoute) -> Bool {
        switch (lhs, rhs) {
        case (.forecast, .forecast):
            return true
        case (.forecastDetails(_), .forecastDetails(_)):
            return true
        default:
            return false
        }
    }
    
}
