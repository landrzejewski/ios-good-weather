//
//  ForecastFactory.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

final class ForecastFactory {
    
    private lazy var fakeForecastProvider: ForecastProvider = FakeForecastProvider()
    
    private lazy var urlSessionForecastProviderMapper: URLSessionForecastProviderMapper = URLSessionForecastProviderMapper()
    private lazy var urlSessionForecastProvider: URLSessionForecastProvider =
        URLSessionForecastProvider(url: "https://api.openweathermap.org/data/2.5/forecast/daily?cnt=7&units=metric&APPID=b933866e6489f58987b2898c89f542b8")
    private lazy var urlSessionProviderAdapter: URLSessionForecastProviderAdapter
        = URLSessionForecastProviderAdapter(provider: urlSessionForecastProvider, mapper: urlSessionForecastProviderMapper)
    
    private lazy var fakeforecastRepository: ForecastQueries & ForecastUpdates = FakeForecastReposiory()
    private lazy var sqlForecastRepository: (ForecastQueries & ForecastUpdates)? = try? SqlForecastRepository()
    
    private lazy var getForecastService: GetForecastUseCase = GetForecastService(forecastProvider: urlSessionProviderAdapter, forecastRepository: sqlForecastRepository!)
    
    private lazy var fakeLocationProvider: LocationProvider = FakeLocationProvider()
    private lazy var coreLocationProvider: LocationProvider = CoreLocationProvider()
    
    private lazy var forecastViewModelMapper: ForecastViewModelMapper = ForecastViewModelMapper()

    lazy var forecastViewModel = ForecastViewModel(getForecastUseCase: getForecastService, locationProvider: coreLocationProvider, mapper: forecastViewModelMapper)
    
}
