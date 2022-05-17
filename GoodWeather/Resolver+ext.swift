//
//  Resolver+ext.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    
    static public func registerAllServices() {
        registerForecastComponents()
    }
    
}
