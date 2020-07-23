//
//  Avaliacao.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 22/07/20.
//

import Foundation

struct Avaliacao: Hashable, Codable, Identifiable {
    var id: Int
    var dataHoraRegistro: Date
    var nota: Int
    fileprivate var localRegistro: Coordinates
}
