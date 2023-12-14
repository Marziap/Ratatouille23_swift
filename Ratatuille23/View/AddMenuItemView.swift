//
//  AddMenuItemView.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 27/09/23.
//

import SwiftUI

struct AddMenuItemView: View {
    
    @State private var nome = datas.selected.nome ?? ""
    @State private var prezzo = ""
    @State private var descrizione = datas.selected.descrizione ?? ""
    @State private var allergeni = datas.selected.allergeni ?? ""
    @State private var categoria = ""
    @State private var posizione = ""
    @State private var showOFF = false
    var body: some View {
        VStack {
            Text("Aggiungi piatto")
                .font(Font.custom("Roboto", size: 45))
                .foregroundColor(.black)
                .padding(.bottom, 50)
            TextField("Nome piatto", text: $nome)
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
            .font(Font.custom("Roboto", size: 25))
            TextField("Prezzo", text: $prezzo)
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
            .font(Font.custom("Roboto", size: 25))
            TextField("Descrizione", text: $descrizione)
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
            .font(Font.custom("Roboto", size: 25))
            TextField("Allergeni", text: $allergeni)
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
            .font(Font.custom("Roboto", size: 25))
            TextField("Categoria", text: $categoria)
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
            .font(Font.custom("Roboto", size: 25))
            TextField("Posizione", text: $posizione)
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
            .font(Font.custom("Roboto", size: 25))
            
            Button {
                //add item to db
            } label: {
                Text("Aggiungi")
                    .padding()
                    .font(Font.custom("Roboto", size: 25))
                    .fontWeight(.medium)
            }
            .background(.myPink)
            .cornerRadius(100)
            .foregroundColor(.accent)
            .padding()
            
            Button {
                showOFF=true;
            } label: {
                Text("Carica da OpenFoodFacts")
                    .padding()
                    .font(Font.custom("Roboto", size: 25))
                    .fontWeight(.medium)
            }
            .background(.accent)
            .cornerRadius(100)
            .foregroundColor(.white)
            .padding()
        }.sheet(isPresented: $showOFF, content: {
            OpenFoodFactsView()
        })
    }
}

#Preview {
    AddMenuItemView()
}
