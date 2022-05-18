//
//  ForecastDetailsView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import SwiftUI

struct ForecastDetailsView: View {
    
    @EnvironmentObject
    private var router: ForecastRouter
    var viewModel: DayForecastViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.primaryColor, .secondaryColor], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack {
                    Image(systemName: "chevron.backward")
                        .templateStyle(width: 20, height: 20)
                        .onTapGesture { router.route = .forecast }
                    Spacer()
                }
                .padding()
                Spacer()
                Text(viewModel.description)
                    .defaultStyle(size: 32)
                Spacer()
            }
        }
    }
    
}

struct ForecastDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastDetailsView(viewModel: DayForecastViewModel(id: UUID(), date: "Pn", temperature: "20.0°", pressure: "hPa", icon: "cloud.sun.fill", description: "Cloudy"))
    }
}
