//
//  URLSessionForecastProviderError.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation

enum URLSessionForecastProviderError: Error {
    
    case error(String)
    case invalidRequestUrl
    case requestFailed(Int)
    case invalidResponseData
    case parsingFailed(String)
    
}
