//
//  RouterView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import SwiftUI
import Resolver

struct RouterView: View {
    
    @EnvironmentObject
    private var router: Router
    @Injected
    private var viewModel: ForecastViewModel
    
    var body: some View {
        switch router.route {
        case .forecast:
            ForecastView(viewModel: viewModel)
        case .forecastDetails:
            ForecastDetailsView()
        }
    }
    
}

struct RouterView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView()
    }
}
