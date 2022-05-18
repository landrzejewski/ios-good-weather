//
//  FakeProfileEventBus.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import Foundation
import Combine

final class FakeProfileEventBus : ProfileEventBus {
   
    var profile = CurrentValueSubject<Profile, Never>(Profile(firstName: "Jan", lastName: "Kowalski", dateOfBirth: Date(), email: "jan@training.pl", password: "123", isSubscriber: false, card: nil))
    
}
