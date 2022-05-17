//
//  ConsoleLoggger.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

import Foundation

final class ConsoleLogger: Logger {
  
    func log(level: LoggingLevel, message: String) {
        print("\(level): \(message)")
    }
    
}
