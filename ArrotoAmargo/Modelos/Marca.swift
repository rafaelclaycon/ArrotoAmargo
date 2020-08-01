//
//  Marca.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 01/08/20.
//

import Foundation
import CoreLocation

struct Marca: Hashable, Codable, Identifiable {
    var id: Int
    var nome: String
    var proprietario: String
    var enderecoSede: String
    var nomeImagem: String
}
