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
        let profile = Profile(firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth, email: email, password: password, isSubscriber: isSubscriber, card: UserCard(number: cardNumber, cvv: cardCvv, expirationDate: cardExpirationDate))
        profileEventBus.profile.send(profile)
    }
    
    private func update(profile: Profile) {
        firstName = profile.firstName
        lastName = profile.lastName
        email = profile.email
        password = profile.password
        isSubscriber = profile.isSubscriber
        cardNumber = profile.card?.number ?? ""
        cardCvv = profile.card?.number ?? ""
        cardExpirationDate = profile.card?.expirationDate ?? Date()
    }
    
}
