//
//  AmmiMenuView.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 23/09/23.
//

import SwiftUI

struct WaiterMenuView: View {
@State private var selected = "antipasti"
@State private var tavolo = ""
@State private var showZero = false
@State private var showAdd = false
@State private var showAlertZero = false
@State private var showAlertTable = false
@State var menuItems: [MenuItem] = []
@State var menuItemsFiltered: [MenuItem] = []
    var body: some View {
        VStack {
            HStack{
                    VStack(alignment: .center){
                        ScrollView{
                            ForEach(menuItemsFiltered) { item in
                                    piattoWaiter(testo: item.nome ?? " ")
                                
                            }
                            .onChange(of: selected, perform: { value in
                                menuItemsFiltered=menuItems.filter({$0.categoria==selected})
                            })
                            //piatti
                        }
                        .frame(width: 350)
                        HStack{
                            bottone(testo: "Azzera", bg: .myPink, fg: .accent, size: 25) {
                                //showZero=true
                                showAlertZero=true
                            }
                            //bottoni
                            bottone(testo: "Salva", bg: .accent, fg: .white, size: 25) {
                                //showAdd=true
                                showAlertTable=true
                            }
                        }
                        .frame(width: 350)
                    }.task {do{
                        menuItems = try await serverAPI.getMEnuItems(restaurant_id:
                                                                        datas.dipendenti[0].id_ristorante!)
                        menuItemsFiltered=menuItems.filter({$0.categoria==selected})
                    }catch{
                        print("Error")
                    }
                    }
                    
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
                    .offset(x:-40)
                    
            }
        }/*.sheet(isPresented: $showZero, content: {
            Text("Azzerato")
        })*/
        /*.sheet(isPresented: $showAdd, content: {
            Text("inserisci tavolo")
        })*/
        .alert("Azzerato", isPresented: $showAlertZero) {
            Button("OK", role: .cancel) { print("tavolo "+tavolo)}
        }
        .alert("Inserisci tavolo", isPresented: $showAlertTable) {
            TextField("Inserisci il tavolo", text: $tavolo)
            Button("Invia", role: .cancel) { /*aggiungi ordine al db*/}
        }
    }
}

/*#Preview {
    WaiterMenuView()
}*/
