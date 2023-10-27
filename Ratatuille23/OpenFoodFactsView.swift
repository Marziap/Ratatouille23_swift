//
//  OpenFoodFactsView.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 10/10/23.
//

import SwiftUI

struct OpenFoodFactsView: View {
    @State var menuItems: [OFF] = []
    var body: some View {
        VStack {
            Text("Aggiungi da OFF")
                .font(Font.custom("Roboto", size: 45))
                .foregroundColor(.black)
                .padding(.vertical, 20)
            ScrollView{
                ForEach(menuItems, id: \.self) { item in
                    if(item.nome != nil){
                        piatto(testo: item.nome ?? "")
                            .onTapGesture {
                                print("nome: " + item.nome!)
                                datas.selected.allergeni=item.allergeni ?? ""
                                datas.selected.nome=item.nome!
                                datas.selected.descrizione=item.descrizione ?? ""
                                print("datas nome: " + datas.selected.nome!)
                            }
                    }
                }
                //piatti
            }
        }.task {
            do{
                menuItems = try await serverAPI.getOff()
                datas.openfoodfacts = menuItems
            }catch{
                print(error)
            }
        }
    }
}

#Preview {
    OpenFoodFactsView()
}
