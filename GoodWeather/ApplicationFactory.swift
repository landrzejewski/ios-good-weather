//
//  ApplicationFactory.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

final class ApplicationFactory {
    
    static var shared = ApplicationFactory()
    
    private init() {
    }
    
    private lazy var forecastProvider: ForecastProvider = FakeForecastProvider()
    private lazy var forecastRepository: ForecastQueries & ForecastUpdates = FakeForecastReposiory()
    private lazy var getForecastService: GetForecastUseCase = GetForecastService(forecastProvider: self.forecastProvider, forecastRepository: self.forecastRepository)
    private lazy var locationProvider: LocationProvider = FakeLocationProvider()

    lazy var forecastViewModel = ForecastViewModel(getForecastUseCase: self.getForecastService, locationProvider: self.locationProvider)
    
}
