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
    var nota: Int
    var localConsumo: String
    var anotacoes: String
    fileprivate var coordenadas: Coordinates
    var localRegistro: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordenadas.latitude,
            longitude: coordenadas.longitude)
    }
    
    init(dataHora: Date, nota: Int, localConsumo: String, anotacoes: String, localRegistroLatitude: Double, localRegistroLongitude: Double) {
        self.id = UUID().uuidString
        self.dataHoraRegistro = dataHora
        self.nota = nota
        self.localConsumo = localConsumo
        self.anotacoes = anotacoes
        self.coordenadas = Coordinates(latitude: localRegistroLatitude, longitude: localRegistroLongitude)
    }
}
