//
//  URLSessionAuthenticationProviderMapper.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 20/05/2022.
//

import Foundation

final class URLSessionAuthenticationProviderMapper {
    
    func toDto(login: String, password: String) -> CredentialsDto {
        return CredentialsDto(login: login, password: password)
    }
    
    func toDomain(authenticationDto: AuthenticationDto) -> String {
        return authenticationDto.accessToken
    }
    
}
