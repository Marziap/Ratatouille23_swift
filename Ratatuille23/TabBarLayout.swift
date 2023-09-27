//
//  TabBarLayout.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 23/09/23.
//

import Foundation
import SwiftUI

struct TabBarLayout: View {
    init() {
            UITabBar.appearance().backgroundColor = UIColor.white
            }
    
    var body: some View {
        TabView {
            AmmiDetailsView()
                .tabItem {
                    Image(systemName:"gearshape")
                    Text("Attività")
                }
            
            AmmiAddDipeView()
                .tabItem{
                    Image(systemName: "person.fill.badge.plus")
                    Text("Dipendenti")
                }
            
            AmmiMenuView()
                .tabItem{
                    Image(systemName: "menucard.fill")
                    Text("Menu")
                }
            
            AmmistatisticsView()
                .tabItem{
                    Image(systemName: "chart.bar.fill")
                    Text("Statistiche")
                }
            
        }
    }
}

#Preview {
    TabBarLayout()
}


