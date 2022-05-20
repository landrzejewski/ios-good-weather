//
//  AuthenticationService.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 20/05/2022.
//

import Foundation
import Resolver
import Combine

final class AuthenticationService: AuthenticationUseCase {
    
    @Injected
    var provider: AuthenticationProvider
   
    func authenticate(login: String, password: String) -> AnyPublisher<String, AuthenticationError> {
        return provider.authenticate(login: login, password: password)
            .mapError { _ in AuthenticationError.authenticationFailed }
            .eraseToAnyPublisher()
    }
    
}
