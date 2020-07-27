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
    var estilo: EstiloCerveja
    var cor: Float?
    var notasDegustacao: String?
    var fotosUsuario: [String]?
    
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

enum EstiloCerveja: String {
    case americanPaleAle = "American Pale Ale"
    case indiaPaleAle = "India Pale Ale"
    case pilsen = "Pilsen"
    case americanLager = "American Lager"
    case premium = "Premium"
    case witbier = "Witbier"
    case dunkel = "Dunkel"
    case amberLager = "Amber Lager"
    
    case desconhecido
}

extension EstiloCerveja: Codable {
    public init(from decoder: Decoder) throws {
        self = try EstiloCerveja(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .desconhecido
    }
}
