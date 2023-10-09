//
//  AmmiDetailsView.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 23/09/23.
//

import SwiftUI
import PhotosUI

struct AmmiDetailsView: View {
    @State private var nome = datas.ristorante[0].nome
    @State private var telefono = datas.ristorante[0].telefono
    @State private var indirizzo = datas.ristorante[0].indirizzo
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    var body: some View {
        VStack {
            Text("Dettagli attività")
                .font(Font.custom("Roboto", size: 45))
                .foregroundColor(.black)
            
            TextField("Nome azienda", text: $nome)
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
            .font(Font.custom("Roboto", size: 25))
            
            TextField("Telefono", text: $telefono)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
            .font(Font.custom("Roboto", size: 25))
            
            TextField("Indrizzo", text: $indirizzo)
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
            .font(Font.custom("Roboto", size: 25))
            
            PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()) {
                        Text("Seleziona logo")
                            .font(Font.custom("Roboto", size: 25))
                    }
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            // Retrive selected asset in the form of Data
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
                    }
            
            if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
            
            Button {
                Task {
                    do {
                        let ristorante = Ristorante(nome: nome, telefono: telefono, indirizzo: indirizzo)
                        serverAPI.addRestaurantDB(ristorante: ristorante)
                    }
                }
            } label: {
                Text("Salva")
                    .padding()
                    .font(Font.custom("Roboto", size: 25))
                    .fontWeight(.medium)
            }
            .background(.myPink)
            .cornerRadius(100)
            .foregroundColor(.accent)
            .padding()

            
            
        }
    }
}

/*#Preview {
    AmmiDetailsView()
}*/
