//
//  URLSessionAuthenticationProvider.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 20/05/2022.
//

import Foundation
import Combine

final class URLSessionAuthenticationProvider {
    
    private let url: String
    
    init(url: String) {
        self.url = url
    }
    
    func authenticate(credentialsDto: CredentialsDto) -> AnyPublisher<AuthenticationDto, RequestError> {
        // return URLSession.shared.request(for: url, payload: credentials)
        return URLSession.shared.request(for: url)
    }
    
}
