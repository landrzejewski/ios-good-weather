//
//  FoodListView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import SwiftUI

struct FoodListView: View {
    
    @ObservedObject
    var viewModel: FoodListViewModel
    
    var body: some View {
        ZStack {
            List(viewModel.food) { foodViewModel in
                FoodView(viewModel: foodViewModel)
                    .onTapGesture {
                        viewModel.showDetails = true
                        viewModel.selectedFood = foodViewModel
                    }
            }
            .disabled(viewModel.showDetails)
            .blur(radius: viewModel.showDetails ? 5 : 0)
            if !viewModel.isLoading && viewModel.food.isEmpty {
                EmptyView(imageName: "xmark.circle", message: "Menu is unavailable")
            }
            if viewModel.isLoading {
                LoadingView()
            }
            if let foodViewModel = viewModel.selectedFood, viewModel.showDetails {
                FoodDetailsView(isVisible: $viewModel.showDetails, viewModel: foodViewModel)
            }
        }
    }
    
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView(viewModel: FoodListViewModel())
    }
}
