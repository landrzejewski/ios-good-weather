//
//  FoodView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import SwiftUI

struct FoodView: View {
    
    var viewModel: FoodViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: viewModel.imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 80)
                    .cornerRadius(10)
            } placeholder: {
                Image("placeholder").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 80)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(viewModel.description)
                    .font(.body)
                    .lineLimit(1)
                Text(viewModel.price)
                    .font(.body)
                    .foregroundColor(.primaryColor)
            }
        }
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(viewModel: FoodViewModel(id: 1, name: "Asparagus steak", description: "Nice and healthy steak.", price: "20 zł", imageUrl: URL(string: "https://github.com/landrzejewski/ios-good-weather/blob/main/extras/images/asparagus-steak.png?raw=true")!))
            .frame(width: .infinity, height: 400)
    }
}
