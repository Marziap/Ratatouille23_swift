//
//  AmmiAddDipeView.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 23/09/23.
//

import SwiftUI

struct AmmiAddDipeView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var ruolo = "cuoco"
    var body: some View {
        VStack {
            Text("Aggiungi dipendente")
                .font(Font.custom("Roboto", size: 45))
                .foregroundColor(.black)
                .padding(.bottom, 50)
            
            TextField("Username", text: $username)
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
                .font(Font.custom("Roboto", size: 25))
            
            TextField("Password", text: $password)
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
                .font(Font.custom("Roboto", size: 25))
            
            Picker("", selection: $ruolo) {
                Text("Cuoco")
                    .tag("cuoco")
                Text("Cameriere")
                    .tag("cameriere")
                Text("Supervisore")
                    .tag("supervisore")
            }.pickerStyle(.segmented).padding(.horizontal).padding(.vertical, 30)
            
    
            
            
            Button(action: {
                let employee = Employee(
                    username: username,
                    password: password,
                    ruolo: ruolo,
                    id_ristorante: datas.ristorante[0].id
                )
                serverAPI.addDB(employee: employee)
                username=""
                password=""
                ruolo="cuoco"
                
            }, label: {
                Text("Conferma")
                    .padding()
                    .font(Font.custom("Roboto", size: 25))
                    .fontWeight(.medium)
            })
            .background(.myPink)
            .cornerRadius(100)
            .foregroundColor(.accent)
            .padding()
            
        }
    }
}

#Preview {
    AmmiAddDipeView()
}
