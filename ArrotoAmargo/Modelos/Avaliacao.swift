//
//  Avaliacao.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 22/07/20.
//

import Foundation
import CoreLocation

struct Avaliacao: Hashable, Codable, Identifiable {

    var id: String
    var dataHoraRegistro: Date
    var localConsumo: String
    var nota: Int
    var anotacoes: String
    var foto: Imagem?

    init(dataHora: Date, nota: Int, localConsumo: String, anotacoes: String, localRegistroLatitude: Double, localRegistroLongitude: Double) {
        self.id = UUID().uuidString
        self.dataHoraRegistro = dataHora
        self.nota = nota
        self.localConsumo = localConsumo
        self.anotacoes = anotacoes
    }

}
