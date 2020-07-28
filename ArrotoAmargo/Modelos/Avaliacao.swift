//
//  Avaliacao.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 22/07/20.
//

import Foundation
import CoreLocation

struct Avaliacao: Hashable, Codable, Identifiable {
    var id: Int
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
}
