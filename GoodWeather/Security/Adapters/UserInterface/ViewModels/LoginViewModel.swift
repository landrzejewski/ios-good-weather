//
//  LoginViewModel.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import Foundation
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
 
    func test() {
        let result: AnyPublisher<Authentication, RequestError> = URLSession.shared
            .request(for: "http://localhist:3000/auth", method: .post, payload: Credentials(login: "jan", password: "123"))
        
    }
}

struct Authentication: Decodable {
    
    let accessToken: String
    
}

struct Credentials: Encodable {
    
    let login: String
    let password: String
    
}
