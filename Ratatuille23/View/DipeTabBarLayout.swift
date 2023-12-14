//
//  TabBarLayout.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 23/09/23.
//

import Foundation
import SwiftUI

struct DipeTabBarLayout: View {
    init() {
            UITabBar.appearance().backgroundColor = UIColor.white
            }
    
    var body: some View {
        TabView(selection: .constant(2)) {
            Text("ordinazioni totali")
                .tabItem {
                    Image(systemName:"globe")
                    Text("Totali")
                }.tag(0)
            
            Text("mie ordinazioni")
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("Mie")
                }.tag(1)
            
           WaiterMenuView()
                .tabItem{
                    Image(systemName: "pencil.and.scribble")
                    Text("Ordina")
                }.tag(2)
            
        }
    }
}

#Preview {
    DipeTabBarLayout()
}


