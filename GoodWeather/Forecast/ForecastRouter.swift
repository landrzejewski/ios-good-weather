//
//  ForecastRouter.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

final class ForecastRouter: ObservableObject, Equatable {
    
    @Published
    var route = ForecastRoute.forecast
    
    static func == (lhs: ForecastRouter, rhs: ForecastRouter) -> Bool {
        return lhs.route == rhs.route
    }

}
