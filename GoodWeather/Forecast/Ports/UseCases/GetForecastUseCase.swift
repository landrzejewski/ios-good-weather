//
//  GetForecastUseCase.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

protocol GetForecastUseCase {
    
    func getForecast(for city: String, callback: @escaping (Result<Forecast, GetForecastError>) -> ())
    
    func getForecast(for location: (Double, Double), callback: @escaping (Result<Forecast, GetForecastError>) -> ())

}
