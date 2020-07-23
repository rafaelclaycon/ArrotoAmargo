//
//  Cerveja.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 09/07/20.
//

import SwiftUI
import CoreLocation

struct Cerveja: Hashable, Codable, Identifiable {
    var id: Int
    var nome: String
    fileprivate var nomeImagem: String
    fileprivate var coordenadas: Coordinates
    var nomeFamiliaCerveja: String
    var nomeCervejaria: String
    var nota: Int
    var ibu: Float
    var teorAlcoolico: Float
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordenadas.latitude,
            longitude: coordenadas.longitude)
    }
    
    var avaliacoes: [Avaliacao]?
}

extension Cerveja {
    var imagem: Image {
        ImageStore.shared.image(name: nomeImagem)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
