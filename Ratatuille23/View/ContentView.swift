//
//  ContentView.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 23/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var goToAmmi = false
    @State private var goToDipe = false
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Text("Ratatouille\n2023")
                        .font(Font.custom("Roboto", size: 55))
                    .foregroundColor(.black)
                    Image("logo")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .scaledToFit()
                        .offset(x: 70, y: 60)
                }.padding(.bottom, 40)
                
                Button(action: {
                    
                    goToAmmi=true
                    
                }, label: {
                    Text("Amministratore")
                        .padding()
                        .font(Font.custom("Roboto", size: 30))
                        .fontWeight(.medium)
                })
                .background(.accent)
                .cornerRadius(100)
                .foregroundColor(.white)
                .padding()
                .padding(.top, 65)
                
                Button(action: {
                    
                    goToDipe=true
                    
                }, label: {
                    Text("Dipendente")
                        .padding()
                        .font(Font.custom("Roboto", size: 30))
                        .fontWeight(.medium)
                })
                .background(.myPink)
                .cornerRadius(100)
                .foregroundColor(.accent)
                .padding()
                
                
                NavigationLink(destination: AmmiLoginView() ,isActive: $goToAmmi){
                    EmptyView()
                }
                
                NavigationLink(destination: DipeLoginView() ,isActive: $goToDipe){
                    EmptyView()
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
