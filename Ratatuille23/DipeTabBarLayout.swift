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
        TabView {
            Text("ordinazioni totali")
                .tabItem {
                    Image(systemName:"globe")
                    Text("Totali")
                }
            
            Text("mie ordinazioni")
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("Mie")
                }
            
           WaiterMenuView()
                .tabItem{
                    Image(systemName: "pencil.and.scribble")
                    Text("Ordina")
                }
            
        }
    }
}

#Preview {
    DipeTabBarLayout()
}


