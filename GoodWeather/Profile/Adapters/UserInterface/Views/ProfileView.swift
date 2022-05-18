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
            Form {
                
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
}
