//
//  SecurityResolver+ext.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import Foundation

import Foundation
import Resolver

extension Resolver {
    
    static func registerSecurityComponents() {
        register { URLSessionAuthenticationProvider(url: "https://raw.githubusercontent.com/landrzejewski/ios-good-weather/main/extras/token.json") }
        register { URLSessionAuthenticationProviderMapper() }
        register { URLSessionAuthenticationProviderAdapter() as AuthenticationProvider }
        register { AuthenticationService() as AuthenticationUseCase }
        register { LoginViewModel() }
    }
    
}
