//
//  ForecastRouterView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import SwiftUI
import Resolver
import Combine

struct ForecastRouterView: View {
    
    @EnvironmentObject
    private var router: ForecastRouter
    
    @Injected
    private var viewModel: ForecastViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.primaryColor, .secondaryColor], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            switch router.route {
            case .forecast:
                ForecastView(viewModel: viewModel)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            case .forecastDetails(let viewModel):
                ForecastDetailsView(viewModel: viewModel)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            }
        }
        .animation(.default, value: router.route)
    }
        
    
}

struct ForecastRouterView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastRouterView()
    }
}
