//
//  EmptyView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

import SwiftUI

struct EmptyView: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            VStack {
                Image(systemName: imageName)
                    .templateStyle(width: 120, height: 120, color: Color.primary, opacity: 0.3)
                Text(message)
                    .font(.title2)
                    .frame(maxWidth: 200)
                    .foregroundColor(Color.primary)
                    .opacity(0.3)
            }
        }
    }
    
}

struct EmptyView_Previews: PreviewProvider {
    
    static var previews: some View {
        EmptyView(imageName: "cart", message: "Your order is empty. Add some products.")
    }
    
}
