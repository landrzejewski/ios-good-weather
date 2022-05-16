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
    private var router: Router
    @State
    private var showSettings = false
    @AppStorage("cityName") // should be moved to viewModel
    private var storedCityName = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.primaryColor, .secondaryColor], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Image(systemName: "location")
                        .templateStyle(width: 20, height: 20)
                        .onTapGesture { viewModel.refreshForecastForCurrentLocation() }
                    Spacer()
                    Image(systemName: "slider.horizontal.3")
                        .templateStyle(width: 20, height: 20)
                        .onTapGesture { showSettings = true }
                }
                .padding()
                Text(viewModel.cityName)
                    .defaultStyle(size: 32)
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
                    ForEach(viewModel.nextDaysForecast, id: \.id) {
                        DayForecastView(viewModel: $0)
                            .onTapGesture { router.route = .forecastDetails }
                    }
                }
                Spacer()
             }
        }
        .sheet(isPresented: $showSettings) { ForecastSettingsView() }
        .onChange(of: storedCityName, perform: viewModel.refreshForecast(for:))
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                viewModel.refreshForecast(for: storedCityName)
            default:
                {}()
            }
        }
        .alert(isPresented: $viewModel.errors) {
            Alert(title: Text("Alert"), message: Text("Weather refresh failed"), dismissButton: .default(Text("Close")))
        }
     }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(viewModel: ApplicationFactory.shared.forecast.forecastViewModel)
    }
}
