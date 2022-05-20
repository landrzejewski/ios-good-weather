//
//  FakeProfileEventBus.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import Foundation
import Combine
import Resolver

final class FakeProfileEventBus : ProfileEventBus {
    
    @Injected
    var idGenerator: IdGenerator
   
    lazy var profile: CurrentValueSubject<Profile, Never> = {
        CurrentValueSubject<Profile, Never>(Profile(id: idGenerator.getNext(), firstName: "Jan", lastName: "Kowalski", dateOfBirth: Date(), email: "jan@training.pl", password: "123", isSubscriber: true, card: nil))
    }()

}
