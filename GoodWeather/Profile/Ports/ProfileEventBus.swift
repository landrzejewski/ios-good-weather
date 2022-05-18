//
//  ProfileEventBus.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import Foundation
import Combine

protocol ProfileEventBus {
    
    var profile: CurrentValueSubject<Profile, Never> { get }
    
}
