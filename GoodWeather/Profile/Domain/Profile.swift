//
//  User.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import Foundation

struct Profile {
    
    let firstName: String
    let lastName: String
    let dateOfBirth: Date
    let email: String
    let password: String
    let isSubscriber: Bool
    let card: UserCard?
    
}
