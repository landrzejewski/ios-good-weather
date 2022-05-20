//
//  AuthenticationUseCase.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 20/05/2022.
//

import Foundation
import Combine

protocol AuthenticationUseCase {
    
    func authenticate(login: String, password: String) -> AnyPublisher<String, AuthenticationError>
    
}
