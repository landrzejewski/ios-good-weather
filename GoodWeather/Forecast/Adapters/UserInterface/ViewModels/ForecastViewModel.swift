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
    var getForecastUseCase: GetForecastUseCase
    @Injected
    var locationProvider: LocationProvider
    @Injected
    var mapper: ForecastViewModelMapper
    private var cancellable = Set<AnyCancellable>()
    @UserProperty(key: "cityName", defaultValue: "warsaw")
    var cachedCityName: String
    
    init() {
        locationProvider.location.sink { location in
            self.onForecastRefreshed(forecast: self.getForecastUseCase.getForecast(for: location))
        }
        .store(in: &cancellable)
        cityName = cachedCityName
    }
    
    func refreshForecast() {
        if !cityName.isEmpty {
            refreshForecast(for: cityName)
        } else {
            refreshForecastForCurrentLocation()
        }
    }
    
    func refreshForecast(for city: String) {
        onForecastRefreshed(forecast: getForecastUseCase.getForecast(for: city))
    }
    
    func refreshForecastForCurrentLocation() {
        locationProvider.refreshLocation()
    }
 
    private func onForecastRefreshed(forecast: AnyPublisher<Forecast, GetForecastError>) {
        forecast.receive(on: DispatchQueue.main)
            .sink(receiveCompletion: onForecastRefreshed, receiveValue: update)
            .store(in: &cancellable)
    }
    
    private func onForecastRefreshed(completion: Subscribers.Completion<GetForecastError>) {
        switch completion {
        case .failure(_):
            errors = true
        default:
            errors = false
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
