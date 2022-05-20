//
//  ProfileResolver+ext.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import Foundation
import Resolver

extension Resolver {
    
    static func registerProfileComponents() {
        register { FakeProfileEventBus() as ProfileEventBus }
            .scope(.application)
        register { ProfileViewModel() }
    }
    
}
