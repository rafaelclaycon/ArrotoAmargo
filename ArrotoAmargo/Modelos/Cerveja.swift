//
//  Cerveja.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 09/07/20.
//

import SwiftUI
import CoreLocation

struct Cerveja: Hashable, Codable, Identifiable {

    // MARK: - Propriedades do objeto
    var id: String
    var nome: String
    var nota: Int?
    var ibu: Float
    var teorAlcoolico: Float
    var estilo: EstiloCerveja
    var cor: Float?
    var dataAdicao: Date
    
    // MARK: - Ligações externas
    var imagem: Imagem?
    var cervejaria: Cervejaria?
    var marca: Marca?
    var avaliacoes: [Avaliacao]?

}

//extension Cerveja {
//    var imagem: Image {
//        ImageStore.shared.image(name: nomeImagem)
//    }
//}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

enum EstiloCerveja: String, CaseIterable {
    case americanPaleAle = "American Pale Ale"
    case indiaPaleAle = "India Pale Ale"
    case pilsen = "Pilsen"
    case americanLager = "American Lager"
    case premium = "Premium"
    case witbier = "Witbier"
    case dunkel = "Dunkel"
    case amberLager = "Amber Lager"
    case americanIPA = "American IPA"
    case dortmunderExport = "Dortmunder Export"
    
    case desconhecido
}

extension EstiloCerveja: Codable {
    public init(from decoder: Decoder) throws {
        self = try EstiloCerveja(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .desconhecido
    }
}

struct CorCerveja: Hashable, Codable, Identifiable {
    var id: Int
    var valorSRM: Int
    var exemplos: String
    var valorVermelho: Double
    var valorVerde: Double
    var valorAzul: Double
}
