//
//  AmmiMenuView.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 23/09/23.
//

import SwiftUI

struct AmmiMenuView: View {
@State private var selected = "antipasti"
@State private var showQR = false
@State private var showAdd = false
    var body: some View {
        VStack {
            HStack{
                    VStack(alignment: .center){
                        ScrollView{
                            ForEach(datas.menuItems) { item in
                                
                                if(item.categoria==selected){
                                    piatto(testo: item.nome ?? "Genoveffo")
                                }
                            }
                            //piatti
                        }
                        HStack{
                            bottone(testo: "QR", bg: .myPink, fg: .accent, size: 25) {
                                showQR=true
                            }
                            //bottoni
                            bottone(testo: "Aggiungi", bg: .accent, fg: .white, size: 25) {
                                showAdd=true
                            }
                        }
                    }//.background(.red)
                    
                    ScrollView{
                        
                        //etichette
                        chip(testo: "Antipasti", selected: $selected, function: {selected="antipasti"})

                            Spacer(minLength: 80)
                        chip(testo: "Primi", selected: $selected, function: {selected="primi"})

                            Spacer(minLength: 80)
                        chip(testo: "Secondi", selected: $selected, function: {selected="secondi"})

                            Spacer(minLength: 80)
                        chip(testo: "Frutta", selected: $selected, function: {selected="frutta"})

                            Spacer(minLength: 80)
                        chip(testo: "Dolci", selected: $selected, function: {selected="dolci"})

                            Spacer(minLength: 80)
                        chip(testo: "Bibite", selected: $selected, function: {selected="bibite"})

                            Spacer(minLength: 80)
                    }.frame(width: 80)
                    
            }
        }.sheet(isPresented: $showQR, content: {
            QRCodeView()
        })
        .sheet(isPresented: $showAdd, content: {
            Text("Ciao")
        })
        .task {do{
            datas.menuItems = try await serverAPI.getMEnuItems(restaurant_id: datas.ristorante[0].id!)
        }catch{
            print("Error")
        }
            
            
        }

    }
}

/*#Preview {
    AmmiMenuView()
}*/
