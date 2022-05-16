//
//  FakeLocationProvider.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation
import Combine

final class FakeLocationProvider: LocationProvider {
  
    func refreshLocation() {
    }
    
    var location = Just((52.237049, 21.017532))
        .eraseToAnyPublisher()
    
}
