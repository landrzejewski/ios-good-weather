//
//  Logger.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

import Foundation

protocol Logger {
    
    func log(level: LoggingLevel, message: String)
    
}
