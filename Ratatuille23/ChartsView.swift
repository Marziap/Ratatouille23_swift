import Foundation
import SwiftUI
import Charts


struct MenuItemDefault {
    var nome: String
    var percentage: Double // Represents the percentage of the pie chart
}

struct ChartsView: View {
    
    var nome: String
    
    var body: some View {
        let dati: [MenuItemDefault] = [
            MenuItemDefault(nome: nome, percentage: 70),
            MenuItemDefault(nome: "resto", percentage: 30)
        ]
        
        

        NavigationStack {
            VStack {
                
                Chart {
                    ForEach(dati, id: \.nome) { data in
                 
                        SectorMark(
                            angle: .value(data.nome, data.percentage),
                            angularInset: 1.5
                        )
                        .foregroundStyle(by: .value("Type", data.nome))
                    }
                }
                .frame(height: 500)
            .padding()
            }
            
            Spacer()
            
            .navigationTitle("Statistiche")
        }

    }
}

#Preview {
    ChartsView(nome: "cotoletta")
}
