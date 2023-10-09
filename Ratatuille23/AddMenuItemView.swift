//
//  AddMenuItemView.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 27/09/23.
//

import SwiftUI

struct AddMenuItemView: View {
    
@State private var nome = ""
    @State private var prezzo = ""
    @State private var descrizione = ""
    @State private var allergeni = ""
    @State private var categoria = ""
    @State private var posizione = ""
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
        }.task {
            do {
                datas.openfoodfacts = try await serverAPI.getOff()
                if let firstItem = datas.openfoodfacts.first {
                    print("Qui " + (firstItem.nome ?? " ") )
                }
            } catch {
                // Handle errors here
                print("Error fetching data: \(error)")
            }
        }
        .onChange(of: nome) { newValue in
            if let item = datas.openfoodfacts.first(where: { $0.nome == newValue }) {
                descrizione = item.descrizione ?? ""
                nome = item.nome ?? ""
                allergeni = item.allergeni ?? ""
            }
        }
    }
}

#Preview {
    AddMenuItemView()
}
