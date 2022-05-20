//
//  UuidGenerator.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 20/05/2022.
//

import Foundation

final class UuidGenerator: IdGenerator {
  
    func getNext() -> String {
        return UUID().uuidString
    }

}
