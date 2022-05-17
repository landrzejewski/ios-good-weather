//
//  Resolver+ext.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    
    static func registerGlobalComponents() {
        register { ConsoleLogger() as Logger }
    }
    
    static public func registerAllServices() {
        registerGlobalComponents()
        registerForecastComponents()
    }
    
}
