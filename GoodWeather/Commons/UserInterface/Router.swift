//
//  Router.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

final class Router: ObservableObject {
    
    @Published
    var route = Route.forecast
    
}
