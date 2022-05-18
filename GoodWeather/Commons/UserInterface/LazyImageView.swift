//
//  LazyImageView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

import SwiftUI

struct LazyImageView: View {
    
    @ObservedObject private var viewModel: LazyImageViewModel
    
    init(urlString: String) {
        viewModel = LazyImageViewModel(urlString: urlString)
    }
    
    var body: some View {
        viewModel.image?.resizable() ?? Image("placeholder").resizable()
    }
    
}
