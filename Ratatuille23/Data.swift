//
//  Data.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 23/09/23.
//

import Foundation
import SwiftUI

class Datas: ObservableObject{

    @Published var dipendenti: [Employee] = []
    @Published var ristorante: [Ristorante] = []
    @Published var menuItems: [MenuItem] = []
    @Published var openfoodfacts: [OFF] = []
}
var datas = Datas()
