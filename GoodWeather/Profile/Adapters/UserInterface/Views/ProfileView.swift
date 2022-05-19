//
//  ProfileView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject
    var viewModel: ProfileViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Personal info")) {
                        TextField("First name", text: $viewModel.firstName)
                        TextField("Last name", text: $viewModel.lastName)
                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        SecureField("Password", text: $viewModel.password)
                        DatePicker("Date of birth", selection: $viewModel.dateOfBirth, displayedComponents: .date)
                        Toggle("Subscriber", isOn: $viewModel.isSubscriber)
                            .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                    }
                    if !viewModel.errors.isEmpty {
                        ForEach(viewModel.errors, id: \.self) {
                            Text($0).foregroundColor(.red)
                        }
                    }
                    if viewModel.isSubscriber {
                        Section(header: Text("Card info")) {
                            TextField("Card number", text: $viewModel.cardNumber)
                            TextField("CVV", text: $viewModel.cardCvv)
                            DatePicker("Expiration date", selection: $viewModel.cardExpirationDate, displayedComponents: .date)
                        }
                    }
                }
                Button(action: { viewModel.save() }) {
                    Text("Save")
                        .frame(width: 200, height: 40)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                }
                .cornerRadius(8)
                Spacer()
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
}
