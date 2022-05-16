//
//  DefaultButtonStyle.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation
import SwiftUI

struct DefaultButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.primary.opacity(0.5) : Color.primary)
    }
    
}
