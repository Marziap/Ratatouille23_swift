//
//  Components.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 23/09/23.
//

import Foundation
import SwiftUI


struct bottone: View {
    let testo: String
    let bg: Color
    let fg: Color
    let size: Int
    var function: () -> Void
    
    var body: some View {
        Button(action: {
            function()
        }, label: {
            Text(testo)
                .padding()
                .font(Font.custom("Roboto", size: CGFloat(size)))
                .fontWeight(.medium)
        })
        .background(bg)
        .cornerRadius(100)
        .foregroundColor(fg)
        .padding()
    }
        
}

struct piatto: View {
    var testo: String
    var body: some View{
        Text(testo)
            .multilineTextAlignment(.center)
            .padding()
            .font(Font.custom("Roboto", size: 25))
            .fontWeight(.medium)
    }
}


struct chip: View {
    var testo: String
    @Binding var selected: String
    var function: () -> Void
    
    var body: some View {
        if selected == testo.lowercased() {
            return AnyView(
                Button(action: {
                    function()
                }) {
                    Text(testo)
                        .frame(width: 100)
                        .multilineTextAlignment(.trailing)
                        .padding(20)
                        .padding(.top, 20)
                        .font(Font.custom("Roboto", size: 25))
                        .fontWeight(.medium)
                        .background(.myGray)
                        .cornerRadius(10)
                        .rotationEffect(.degrees(90))
                        .offset(x: 30)
                        .foregroundColor(.black)
                }
                //.disabled(true)
            )
        } else {
            return AnyView(
                Button(action: {
                    function()
                }) {
                    Text(testo)
                        .frame(width: 100)
                        .multilineTextAlignment(.trailing)
                        .padding(20)
                        .font(Font.custom("Roboto", size: 25))
                        .fontWeight(.medium)
                        .background(.myLightGray)
                        .cornerRadius(10)
                        .rotationEffect(.degrees(90))
                        .offset(x: 40)
                        .foregroundColor(.black)
                }
                //.disabled(false)
            )
        }
    }
}

    

