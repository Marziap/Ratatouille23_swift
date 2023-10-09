//
//  AmmistatisticsView.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 24/09/23.
//

import SwiftUI

struct AmmistatisticsView: View {
@State private var dateTimeFrom = Date.now
@State private var dateTimeTo = Date.now
@State private var selected=1
@State private var selectedItem=0
@State private var showStatistics=false
@State private var dipendenti = []
    var body: some View {
        VStack {
            Text("Statistiche")
                .font(Font.custom("Roboto", size: 45))
                .foregroundColor(.black)
            
            Picker("", selection: $selected) {
                Text("Ordinazioni")
                    .tag(1)
                Text("Dipendenti")
                    .tag(0)
            }.pickerStyle(.segmented).padding(.horizontal).padding(.top, 30)
            
            VStack {
                DatePicker("From", selection: $dateTimeFrom)
                DatePicker("To", selection: $dateTimeFrom)
            }.padding([.top, .horizontal], 50)
            
            HStack {
                if(selected==0){
                    Picker(selection: $selectedItem, label: Text("Select employee")) {
                        ForEach(datas.dipendenti) { item in
                            Text(item.username!)
                        }
                    }.pickerStyle(WheelPickerStyle())
                        .padding(.horizontal)
                    
                    bottone(testo: "Calcola", bg: .myPink, fg: .accent, size: 25) {
                        //if richiesta a buon fine
                        showStatistics=true
                    }
                }else{
                    Picker(selection: $selectedItem, label: Text("Select Menu item")) {
                        ForEach(datas.menuItems) { item in
                            Text(item.nome!)
                        }
                    }.pickerStyle(WheelPickerStyle())
                        .padding(.horizontal)
                    
                    bottone(testo: "Calcola", bg: .myPink, fg: .accent, size: 25) {
                        //if richiesta a buon fine
                        showStatistics=true
                    }
                }
                
            }
        }.sheet(isPresented: $showStatistics, content: {
            Text("Ciao")
        })
    }
}

/*#Preview {
    AmmistatisticsView()
}*/
