//
//  ApplicationFactory.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

final class ApplicationFactory {
    
    static var shared = ApplicationFactory()
    
    var forecast = ForecastFactory()
    
    private init() {
    }

}
