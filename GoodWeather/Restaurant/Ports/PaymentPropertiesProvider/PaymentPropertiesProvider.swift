//
//  PaymentsPropertieProvider.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 20/05/2022.
//

import Foundation

protocol PaymentPropertiesProvider {
    
    func load() -> PaymentProperties?
    
}
