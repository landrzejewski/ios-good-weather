//
//  LocationProvider.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation
import Combine

protocol LocationProvider {
    
    func refreshLocation()
    
    var location: AnyPublisher<(Double, Double), Never> { get }
    
}
