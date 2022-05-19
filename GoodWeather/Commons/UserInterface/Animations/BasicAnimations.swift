//
//  BasicAnimations.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 19/05/2022.
//

import SwiftUI

struct BasicAnimations: View {
    
    @State
    var change = false
    @State
    var height: CGFloat = 100
    @State
    var width: CGFloat = 100
    
    var body: some View {
        VStack {
            Spacer()
            /*GeometryReader { reader in
                RoundedRectangle(cornerRadius: 10)
                    //.foregroundColor(change ? .primaryColor : .secondaryColor)
                
                    //.foregroundColor(.primaryColor)
                    //.hueRotation(Angle.degrees(change ? 50 : 0))
                
                    .foregroundColor(.primaryColor)
                    //.offset(x: 0, y: change ? reader.size.height - 200 : 100)
                    .opacity(change ? 1 : 0.5)
                    .rotationEffect(Angle.degrees(change ? 90 : 0), anchor: .center)
                    //.frame(width: change ? 300 : 200, height: change ? 300 : 200)
                    .scaleEffect(change ? 0.2 : 1)
                    .cornerRadius(change ? 10 : 5)
                
                    .padding()
                    .frame(width: 200, height: 200)
                    //.animation(.easeInOut(duration: 3).delay(3), value: change)
                    //.animation(.easeInOut.delay(3), value: change)
                    //.animation(.easeInOut.repeatCount(4), value: change)
                    .animation(Animation.easeIn(duration: 1).repeatCount(3, autoreverses: true), value: change)
            }*/
            
            /*HStack {
                Color.red.hueRotation(Angle.degrees(change ? 180 : 0))
                Color.green.hueRotation(Angle.degrees(change ? 180 : 0))
                    .animation(.easeIn(duration: 5), value: change)
                Color.blue.hueRotation(Angle.degrees(change ? 180 : 0))
            }
            .animation(.linear, value: change)*/
            
            /*RoundedRectangle(cornerRadius: 10)
                .size(width: width, height: height)
                .foregroundColor(.primaryColor)*/
            
            /*RoundedRectangle(cornerRadius: 10)
                .size(width: width, height: height)
                .foregroundColor(.primaryColor)
                .scaleEffect(change ? 1 : 0.01)
                .animation(.spring(dampingFraction: 0.5), value: change)*/
            
            if change {
                RoundedRectangle(cornerRadius: 10)
                    .size(width: width, height: height)
                    .foregroundColor(.primaryColor)
                    //.transition(.scale.combined(with: .opacity))
                    .transition(.asymmetric(insertion: .slide, removal: .opacity))
            }
            
            Spacer()
            Button(action: {
                withAnimation {
                
                
                change.toggle()
                }
//                withAnimation {
//                    width = 200
//                }
            }) {
                Text("Start")
                    .frame(width: 200, height: 40)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
            }
            .cornerRadius(8)
        }
    }
}

struct BasicAnimations_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations()
    }
}
