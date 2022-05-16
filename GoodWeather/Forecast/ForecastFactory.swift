//
//  ForecastFactory.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

final class ForecastFactory {
    
    private lazy var forecastProvider: ForecastProvider = FakeForecastProvider()
    private lazy var forecastRepository: ForecastQueries & ForecastUpdates = FakeForecastReposiory()
    private lazy var getForecastService: GetForecastUseCase = GetForecastService(forecastProvider: self.forecastProvider, forecastRepository: forecastRepository)
    private lazy var locationProvider: LocationProvider = FakeLocationProvider()
    private lazy var forecastViewModelMapper: ForecastViewModelMapper = ForecastViewModelMapper()

    lazy var forecastViewModel = ForecastViewModel(getForecastUseCase: getForecastService, locationProvider: locationProvider, mapper: forecastViewModelMapper)
    
}
