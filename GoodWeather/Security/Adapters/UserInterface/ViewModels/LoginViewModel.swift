//
//  LoginViewModel.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published
    var login = ""
    @Published
    var password = ""
    @Published
    var error = false
    @Published
    var isLoading = false
    
}
