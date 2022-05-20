//
//  ProfileViewModel.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import Foundation
import Resolver
import Combine

final class ProfileViewModel: ObservableObject {
    
    @Published
    var firstName = ""
    @Published
    var lastName = ""
    @Published
    var dateOfBirth = Date()
    @Published
    var email = ""
    @Published
    var password = ""
    @Published
    var isSubscriber = false
    @Published
    var cardNumber = ""
    @Published
    var cardCvv = ""
    @Published
    var cardExpirationDate = Date()
    @Published
    var errors: [String] = []
    private var id: String = ""
    
    @Injected
    var profileEventBus: ProfileEventBus
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        profileEventBus.profile
            .sink(receiveCompletion: { _ in}, receiveValue: update)
            .store(in: &cancellable)
        Publishers.CombineLatest(emailIsValid($email), passwordIsValid($password))
            .map { [$0, $1] }
            .map { errors in errors.filter { !$0.isEmpty } }
            .assign(to: &$errors)
    }
    
    func save() {
        let card = cardNumber.isEmpty ? Optional.none : UserCard(number: cardNumber, cvv: cardCvv, expirationDate: cardExpirationDate)
        let profile = Profile(id: id, firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth, email: email, password: password, isSubscriber: isSubscriber, card: card)
        profileEventBus.profile.send(profile)
    }
    
    private func update(profile: Profile) {
        id = profile.id
        firstName = profile.firstName
        lastName = profile.lastName
        email = profile.email
        password = profile.password
        isSubscriber = profile.isSubscriber
        cardNumber = profile.card?.number ?? ""
        cardCvv = profile.card?.cvv ?? ""
        cardExpirationDate = profile.card?.expirationDate ?? Date()
    }
    
}
