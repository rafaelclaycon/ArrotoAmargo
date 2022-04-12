import SwiftUI
import CoreLocation

struct Beer: Hashable, Codable, Identifiable {

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

//extension Beer {
//    var imagem: Image {
//        ImageStore.shared.image(name: nomeImagem)
//    }
//}

struct Coordinates: Hashable, Codable {

    var latitude: Double
    var longitude: Double

}

//enum EstiloCerveja: String, CaseIterable {
//    case 0 americanPaleAle = "American Pale Ale"
//    case 1 indiaPaleAle = "India Pale Ale"
//    case 2 pilsen = "Pilsen"
//    case 3 americanLager = "American Lager"
//    case 4 premium = "Premium"
//    case 5 witbier = "Witbier"
//    case 6 dunkel = "Dunkel"
//    case 7 amberLager = "Amber Lager"
//    case 8 americanIPA = "American IPA"
//    case 9 dortmunderExport = "Dortmunder Export"
//    
//    case desconhecido
//}

//extension EstiloCerveja: Codable {
//    public init(from decoder: Decoder) throws {
//        self = try EstiloCerveja(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .desconhecido
//    }
//}

struct BeerColor: Hashable, Codable, Identifiable {

    var id: Int
    var valorSRM: Int
    var exemplos: String
    var valorVermelho: Double
    var valorVerde: Double
    var valorAzul: Double

}
