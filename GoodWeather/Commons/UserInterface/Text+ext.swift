//
//  Text+ext.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation
import SwiftUI

extension Text {
    
    func defaultStyle(size: CGFloat = 18) -> some View {
        font(.system(size: size, weight: .medium))
            .foregroundColor(.textColor)
            .iOS { $0.padding(2) }
    }
    
}
