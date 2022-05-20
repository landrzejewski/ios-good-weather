//
//  AuthenticationProvider.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 20/05/2022.
//

import Foundation
import Combine

protocol AuthenticationProvider {
    
    func authenticate(login: String, password: String) -> AnyPublisher<String, AuthenticationProviderError>
    
}
