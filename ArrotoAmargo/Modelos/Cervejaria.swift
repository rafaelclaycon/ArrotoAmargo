//
//  Cervejaria.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 25/07/20.
//

import Foundation
import CoreLocation

struct Cervejaria: Hashable, Codable, Identifiable {
    var id: Int
    var nome: String
    var nomeImagem: String
    fileprivate var coordenadas: Coordinates
    var endereco: String
    var nomeGrupo: String?
    
    var localizacao: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordenadas.latitude,
            longitude: coordenadas.longitude)
    }
}
