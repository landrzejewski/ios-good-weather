//
//  FoodListViewModel.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import Foundation

final class FoodListViewModel: ObservableObject {
    
    
    @Published
    var isLoading = false
    @Published
    var food = [
        FoodViewModel(id: 1, name: "Asparagus steak", description: "Nice and healthy steak.", price: "20 zł", imageUrl: URL(string: "https://github.com/landrzejewski/ios-good-weather/blob/main/extras/images/asparagus-steak.png?raw=true")!),
        FoodViewModel(id: 2, name: "Healthy pizza", description: "Mega pizza.", price: "90 zł", imageUrl: URL(string: "https://github.com/landrzejewski/ios-good-weather/blob/main/extras/images/healthy-pizza.png?raw=true")!)
    ]
    @Published
    var showDetails = false
    var selectedFood: FoodViewModel?
    
}
