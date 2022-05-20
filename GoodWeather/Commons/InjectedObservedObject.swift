//
//  InjectedObservedObject.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 20/05/2022.
//

import Foundation
import Combine
import Resolver
import SwiftUI

@propertyWrapper
public struct InjectedObservedObject<Service>: DynamicProperty where Service: ObservableObject {
 
    @ObservedObject private var service: Service
    
    public init() {
        self.service = Resolver.resolve(Service.self)
    }
    
    public init(name: Resolver.Name, container: Resolver? = nil) {
        self.service = Resolver.resolve(Service.self, name: name)
    }
    
    public var wrappedValue: Service {
        get { return service }
        mutating set { service = newValue }
    }
    
    public var projectedValue: ObservedObject<Service>.Wrapper {
        return self.$service
    }
}
