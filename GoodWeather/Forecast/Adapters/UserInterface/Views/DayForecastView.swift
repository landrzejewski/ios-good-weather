//
//  DayForecastView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import SwiftUI

struct DayForecastView: View {
    
    var viewModel: DayForecastViewModel
    
    var body: some View {
        VStack(spacing: 4) {
            Text(viewModel.date)
                .defaultStyle()
            Image(systemName: viewModel.icon)
                .iconStyle()
            Text(viewModel.temperature)
                .defaultStyle()
        }
    }
}

struct DayForecastView_Previews: PreviewProvider {
    static var previews: some View {
        DayForecastView(viewModel: DayForecastViewModel(id: UUID(), date: "Pn", temperature: "18°", pressure: "1000 hPa", icon: "sun.max.fill", description: "Clear sky"))
            .preferredColorScheme(.dark)
    }
}
