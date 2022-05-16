//
//  RouterView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import SwiftUI

struct RouterView: View {
    
    @EnvironmentObject
    var router: Router
    
    var body: some View {
        let factory = ApplicationFactory.shared
        switch router.route {
        case .forecast:
            ForecastView(viewModel: factory.forecast.forecastViewModel)
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
