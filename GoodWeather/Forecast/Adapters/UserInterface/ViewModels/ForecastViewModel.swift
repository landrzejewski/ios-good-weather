//
//  ForecastViewModel.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation
import Combine
import Resolver

final class ForecastViewModel: ObservableObject {
    
    @Published
    var cityName = ""
    @Published
    var currentForecast: DayForecastViewModel?
    @Published
    var nextDaysForecast: [DayForecastViewModel] = []
    @Published
    var errors = false
    
    @Injected
    private var getForecastUseCase: GetForecastUseCase
    @Injected
    private var locationProvider: LocationProvider
    @Injected
    private var mapper: ForecastViewModelMapper
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        locationProvider.location.sink { location in
            self.getForecastUseCase.getForecast(for: location, callback: self.onForecastRefreshed)
        }
        .store(in: &cancellable)
    }
    
    func refreshForecast() {
        if !cityName.isEmpty {
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
