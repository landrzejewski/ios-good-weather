//
//  ForecastSettingsView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import SwiftUI

struct ForecastSettingsView: View {
    
    @State
    private var cityName = ""
    @Environment(\.presentationMode)
    private var presentationMode
    @AppStorage("cityName") // should be moved to viewModel
    private var storedCityName = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { self.presentationMode.wrappedValue.dismiss() }, label: { closeButton })
            }
            .padding(.top, 6)
            Form {
                Section(header: Text("Place")) {
                    TextField("Enter city name", text: $cityName)
                        .onAppear { cityName = storedCityName }
                        .onDisappear { storedCityName = cityName }
                }
            }
        }
    }
    
    private var closeButton: some View {
        Image(systemName: "xmark.circle")
            .templateStyle(width: 20, height: 20, color: .gray)
            .buttonStyle(DefaultButtonStyle())
            .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 6))
    }
}

struct ForecastSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastSettingsView()
    }
}
