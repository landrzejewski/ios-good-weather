//
//  FoodDetailsView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import SwiftUI

struct FoodDetailsView: View {
    
    @Binding
    var isVisible: Bool
    var viewModel: FoodViewModel
    
    var body: some View {
        VStack {
            AsyncImage(url: viewModel.imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200)
            } placeholder: {
                Image("placeholder").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200)
            }
            Text(viewModel.name)
                .font(.title3)
                .fontWeight(.bold)
            Text(viewModel.description)
                .font(.body)
                .lineLimit(1)
            Text(viewModel.price)
                .font(.body)
                .foregroundColor(.primaryColor)
            Button { isVisible = false } label: {
                Text("Add to cart")
                    .frame(width: 200, height: 40)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
            }
            .cornerRadius(8)
        }
        .padding()
        .background(Color(.systemBackground))
        .border(Color.white, width: 1)
        .clipped()
        .shadow(radius: 10)
        .overlay(Button(action: { isVisible = false }) {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                Image(systemName: "xmark")
                    .foregroundColor(.primaryColor)
                    .frame(width: 40, height: 40)
            }
            .padding(.all, 16)
        }, alignment: .topTrailing)
    }
}

struct FoodDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailsView(isVisible: .constant(false), viewModel: FoodViewModel(id: 1, name: "Asparagus steak", description: "Nice and healthy steak.", price: "20 zł", imageUrl: URL(string: "https://github.com/landrzejewski/ios-good-weather/blob/main/extras/images/asparagus-steak.png?raw=true")!))
    }
}
