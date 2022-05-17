//
//  ForecastViewModel.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation
import Combine

final class ForecastViewModel: ObservableObject {
    
    @Published
    var cityName = ""
    @Published
    var currentForecast: DayForecastViewModel?
    @Published
    var nextDaysForecast: [DayForecastViewModel] = []
    @Published
    var errors = false
    
    private var getForecastUseCase: GetForecastUseCase
    private var locationProvider: LocationProvider
    private var mapper: ForecastViewModelMapper
    private var cancellable = Set<AnyCancellable>()
    
    init(getForecastUseCase: GetForecastUseCase, locationProvider: LocationProvider, mapper: ForecastViewModelMapper) {
        self.getForecastUseCase = getForecastUseCase
        self.locationProvider = locationProvider
        self.mapper = mapper
        locationProvider.location.sink { location in
            self.getForecastUseCase.getForecast(for: location, callback: self.onForecastRefreshed)
        }
        .store(in: &cancellable)
    }
    
    func refreshForecast() {
        if let cityName = UserDefaults.standard.string(forKey: "cityName"), !cityName.isEmpty {
            refreshForecast(for: cityName)
        } else {
            refreshForecastForCurrentLocation()
        }
    }
    
    func refreshForecast(for city: String) {
        getForecastUseCase.getForecast(for: city, callback: onForecastRefreshed)
    }
    
    func refreshForecastForCurrentLocation() {
        locationProvider.refreshLocation()
    }
 
    private func onForecastRefreshed(_ result: Result<Forecast, GetForecastError>) {
        onMainThread { [self] in
            switch result {
            case .success(let forecast):
                errors = false
                update(forecast)
            case .failure(_):
                errors = true
            }
        }
    }
    
    private func update(_ data: Forecast) {
        let forecast = data.forecast.map(mapper.toViewModel)
        if let currentForecast = forecast.first {
            cityName = data.city
            self.currentForecast = currentForecast
            nextDaysForecast = Array(forecast.dropFirst())
        }
    }
    
}
