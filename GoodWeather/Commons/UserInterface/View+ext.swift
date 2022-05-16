//
//  View+ext.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import Foundation
import SwiftUI

extension View {
    
    func iOS<Content: View>(_ modifier: (Self) -> Content) -> some View {
        #if os(iOS)
            return modifier(self)
        #else
            return self
        #endif
    }
    
    
}
