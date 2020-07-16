//
//  AvaliacaoCerveja.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 09/07/20.
//

import SwiftUI
import CoreLocation

struct AvaliacaoCerveja: Hashable, Codable, Identifiable {
    var id: Int
    var nomeCerveja: String
    fileprivate var nomeImagem: String
    fileprivate var coordenadas: Coordinates
    var nomeFamiliaCerveja: String
    var nomeCervejaria: String
    var nota: Int
    var ibu: Int
    var teorAlcoolico: Float
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordenadas.latitude,
            longitude: coordenadas.longitude)
    }
}

extension AvaliacaoCerveja {
    var imagem: Image {
        ImageStore.shared.image(name: nomeImagem)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
