//
//  LoginView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 18/05/2022.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject
    var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .cornerRadius(120)
            Form {
                Section(header: Text("Credentials")) {
                    TextField("Login", text: $viewModel.login)
                    SecureField("Password", text: $viewModel.password)
                }
                if viewModel.error {
                    Text("Invalid login or password")
                        .foregroundColor(.red)
                }
            }
            Button { } label: {
                Text("Authenticate")
                    .frame(width: 200, height: 40)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
            }
            .cornerRadius(8)
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
