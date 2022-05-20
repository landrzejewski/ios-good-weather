//
//  LoginViewModel.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import Foundation
import Resolver
import Combine

final class LoginViewModel: ObservableObject {
    
    @Published
    var login = ""
    @Published
    var password = ""
    @Published
    var error = false
    @Published
    var isLoading = false
    @Published
    var isAuthenticated = false
    @Injected
    var authenticationUseCase: AuthenticationUseCase
    private var cancellable = Set<AnyCancellable>()
    
    func tryLogin() {
        isLoading = true
        authenticationUseCase.authenticate(login: login, password: password)
            .sink(receiveCompletion: onAuthenticationResult, receiveValue: update)
            .store(in: &cancellable)
        
    }
    
    private func update(token: String) {
        isAuthenticated = true
    }
    
    private func onAuthenticationResult(completion: Subscribers.Completion<AuthenticationError>) {
        isLoading = false
        switch completion {
        case .failure(_):
            error = true
            isAuthenticated = false
        default:
            error = false
        }
    }
 
}
