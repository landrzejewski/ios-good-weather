//
//  GetForecastUseCase.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation
import Combine

protocol GetForecastUseCase {
    
    func getForecast(for city: String) -> AnyPublisher<Forecast, GetForecastError>
    
    func getForecast(for location: (Double, Double)) -> AnyPublisher<Forecast, GetForecastError>

}
