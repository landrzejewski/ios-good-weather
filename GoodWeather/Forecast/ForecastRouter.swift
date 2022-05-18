//
//  ForecastRouter.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

final class ForecastRouter: ObservableObject {
    
    @Published
    var route = ForecastRoute.forecast
    
}
