//
//  ForecastView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import SwiftUI

struct ForecastView: View {
    
    @ObservedObject
    var viewModel: ForecastViewModel
    @Environment(\.scenePhase)
    private var scenePhase
    @EnvironmentObject
    private var router: ForecastRouter
    @State
    private var showSettings = false
    @AppStorage("cityName") // should be moved to viewModel
    private var storedCityName = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "location")
                    .templateStyle(width: 20, height: 20)
                    .onTapGesture { viewModel.refreshForecastForCurrentLocation() }
                    .accessibility(identifier: "location")
                Spacer()
                Image(systemName: "slider.horizontal.3")
                    .templateStyle(width: 20, height: 20)
                    .onTapGesture { showSettings = true }
                    .accessibility(identifier: "settings")
            }
            .padding()
            Text(viewModel.cityName)
                .defaultStyle(size: 32)
                .accessibility(identifier: "city")
            Spacer()
            if let currentForecast = viewModel.currentForecast {
                Image(systemName: currentForecast.icon)
                    .iconStyle(width: 200, height: 200)
                Text(currentForecast.description)
                    .defaultStyle(size: 32)
                    .padding(.bottom, 48)
                HStack(spacing: 48) {
                    Text(currentForecast.temperature)
                        .defaultStyle(size: 32)
                    Text(currentForecast.pressure)
                        .defaultStyle(size: 32)
                }
            }
            Spacer()
            HStack(spacing: 16) {
                ForEach(viewModel.nextDaysForecast, id: \.id) { dayForecastViewModel in
                    DayForecastView(viewModel: dayForecastViewModel)
                        .onTapGesture { router.route = .forecastDetails(dayForecastViewModel) }
                }
            }
            Spacer()
        }
        .sheet(isPresented: $showSettings) { ForecastSettingsView() }
        .onAppear { viewModel.refreshForecast() }
        .onChange(of: storedCityName, perform: viewModel.refreshForecast(for:))
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                viewModel.refreshForecast()
            default:
                {}()
            }
        }
        .alert(isPresented: $viewModel.errors) {
            Alert(title: Text("Alert"), message: Text("Weather refresh failed"), dismissButton: .default(Text("Close")))
        }
    }
}

//struct ForecastView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForecastView(viewModel:ApplicationFactory.shared.forecast.forecastViewModel)
//    }
//}
