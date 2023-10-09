//
//  Models.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 23/09/23.
//

import Foundation
import SwiftUI

struct Employee: Codable, Identifiable{
    var id: Int?
    var username: String?
    var password: String?
    var firstaccess: Bool?
    var ruolo: String?
    var id_ristorante: Int?
}

struct OFF: Codable, Identifiable{
    var id: UUID
    var nome: String?
    var allergeni: String?
    var descrizione: String?
}

struct Ristorante: Codable, Identifiable{
    var id: Int?
    var username: String?
    var password: String?
    var nome: String
    var telefono: String
    var indirizzo: String
}

struct MenuItem: Codable, Identifiable{
    var id: Int?
    var nome, descrizione, categoria, allergeni: String?
    var prezzo: Float?
    var id_ristorante: Int?
}
