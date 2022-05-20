//
//  OrderView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 19/05/2022.
//

import SwiftUI

struct OrderView: View {
    
    @ObservedObject
    var viewModel: OrderViewModel
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(viewModel.orderEntries) { entry in
                        HStack {
                            Text(entry.name)
                            Spacer()
                            Text(entry.price)
                        }
                    }
                    .onDelete { viewModel.orderEntries.remove(atOffsets: $0) }
                }
                Spacer()
                Button(action: {}) {
                    Text("Place order \(viewModel.totalPrice)")
                        .frame(width: 200, height: 40)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                }
                .cornerRadius(8)
                .disabled(!viewModel.hasPaymnetProperties)
            }
            if viewModel.orderEntries.isEmpty {
                EmptyView(imageName: "cart", message: "Your order is empty.")
            }
        }
        .navigationTitle("Order")
        .onAppear { viewModel.refreshPaymentsProperties() }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel())
    }
}
