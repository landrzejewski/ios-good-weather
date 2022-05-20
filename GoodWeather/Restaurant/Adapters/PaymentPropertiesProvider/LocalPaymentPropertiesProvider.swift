//
//  LocalPaymentPropertiesProvider.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 20/05/2022.
//

import Foundation
import Combine
import Resolver

final class LocalPaymentPropertiesProvider: PaymentPropertiesProvider {
   
    @Injected
    var profileEvnetBus: ProfileEventBus
    
    private var paymentProperties: PaymentProperties?
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        profileEvnetBus.profile
            .map(toPaymentProperties)
            .sink(receiveCompletion: { _ in}) {
                self.paymentProperties = $0
            }
            .store(in: &cancellable)
    }
    
    func load() -> PaymentProperties? {
        return paymentProperties
    }
    
    private func toPaymentProperties(profile: Profile) -> PaymentProperties? {
        guard let userCard = profile.card else {
            return .none
        }
        return PaymentProperties(properties: [
            "cardNumber": userCard.number,
            "cvv": userCard.cvv,
            "expirationDate": userCard.expirationDate.description
        ])
    }

}
