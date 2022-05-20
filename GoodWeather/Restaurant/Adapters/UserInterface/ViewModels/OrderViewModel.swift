//
//  OrderViewModel.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 19/05/2022.
//

import Foundation
import Resolver

final class OrderViewModel: ObservableObject {
    
    @Injected
    var paymentsPropertiesprovider: PaymentPropertiesProvider
    
    @Published
    var hasPaymnetProperties = false
    @Published
    var orderEntries = [
        OrderEntryViewModel(id: 1, name: "Mega burger", price: "40 zł"),
        OrderEntryViewModel(id: 2, name: "Asparagus steak", price: "20 zł")
    ]
    @Published
    var totalPrice = "60 zł"
    
    func refreshPaymentsProperties() {
        hasPaymnetProperties = paymentsPropertiesprovider.load() != nil
    }
    
}
