//
//  ForecastRouterView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import SwiftUI
import Resolver

struct ForecastRouterView: View {
    
    @EnvironmentObject
    private var router: ForecastRouter
    @Injected
    private var viewModel: ForecastViewModel
    
    var body: some View {
        switch router.route {
        case .forecast:
            ForecastView(viewModel: viewModel)
        case .forecastDetails(let viewModel):
            ForecastDetailsView(viewModel: viewModel)
        }
    }
    
}

struct ForecastRouterView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastRouterView()
    }
}
