//
//  FakeLocationProvider.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation
import Combine

final class FakeLocationProvider: LocationProvider {
    
    private let fakeLocation = (21.017532, 52.237049)
    private let subject = PassthroughSubject<(Double, Double), Never>()
  
    func refreshLocation() {
        subject.send(fakeLocation)
    }
    
    var location: AnyPublisher<(Double, Double), Never>
    
    init() {
        location = subject.eraseToAnyPublisher()
    }
    
}
