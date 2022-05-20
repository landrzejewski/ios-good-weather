//
//  RestaurantResolver.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import Foundation

import Resolver

extension Resolver {
    
    static func registerRestaurantComponents() {
        register { FoodListViewModel() }
        register { LocalPaymentPropertiesProvider() as PaymentPropertiesProvider }
    }
    
}
