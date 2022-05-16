//
//  ForecastViewModel.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

final class ForecastViewModel: ObservableObject {
    
    private var getForecastUseCase: GetForecastUseCase
    private var locationProvider: LocationProvider
    
    init(getForecastUseCase: GetForecastUseCase, locationProvider: LocationProvider) {
        self.getForecastUseCase = getForecastUseCase
        self.locationProvider = locationProvider
    }
    
}
