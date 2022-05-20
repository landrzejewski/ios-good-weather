//
//  URLSessionAuthenticationProviderAdapter.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 20/05/2022.
//

import Foundation
import Resolver
import Combine

final class URLSessionAuthenticationProviderAdapter: AuthenticationProvider {
    
    @Injected
    var provider: URLSessionAuthenticationProvider
    @Injected
    var mapper: URLSessionAuthenticationProviderMapper
    
    func authenticate(login: String, password: String) -> AnyPublisher<String, AuthenticationProviderError> {
        let credentialsDto = mapper.toDto(login: login, password: password)
        return provider.authenticate(credentialsDto: credentialsDto)
            .map(mapper.toDomain)
            .mapError { _ in AuthenticationProviderError.authenticationFailed }
            .eraseToAnyPublisher()
    }
    
}
