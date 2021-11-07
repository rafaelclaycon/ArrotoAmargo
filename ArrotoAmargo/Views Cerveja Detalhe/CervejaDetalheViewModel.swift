//
//  CervejaDetalheViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 25/07/20.
//

import Combine
import SwiftUI
import CoreLocation

class CervejaDetalheViewModel: ObservableObject {
    var cerveja: Cerveja
    //@Published var locationCoordinate: CLLocationCoordinate2D
    @Published var nome: String
    @Published var nomeEstilo: String
    //@Published var imagem: Image
    @Published var cervejaria: Cervejaria
    @Published var marca: Marca
    @Published var nota: Int?
    @Published var ibu: Int
    @Published var teorAlcoolico: Float
    @Published var existemAvaliacoes: Bool
    @Published var avaliacoes: [Avaliacao]?
    @Published var existemFotosUsuario: Bool
    //@Published var idCerveja: Int
    
    init(cerveja: Cerveja) {
        self.cerveja = cerveja
        
        //self.locationCoordinate = cerveja.locationCoordinate
        self.nome = cerveja.nome
        self.nomeEstilo = "NENHUM"
        //self.imagem = cerveja.imagem
        self.cervejaria = cerveja.cervejaria!
        self.marca = cerveja.marca!
        self.ibu = Int(round(cerveja.ibu))
        self.teorAlcoolico = cerveja.teorAlcoolico
        self.avaliacoes = cerveja.avaliacoes?.sorted(by: { $0.dataHoraRegistro > $1.dataHoraRegistro })
        self.existemAvaliacoes = cerveja.avaliacoes != nil
        self.existemFotosUsuario = false
        //self.idCerveja = cerveja.id
        
        self.nota = 0
    }
    
//    func primeiraFoto() -> Image {
//        return ImageStore.shared.image(name: cerveja.fotosUsuario![0])
//    }
    
//    func getTextoEstilo() -> Text {
//        switch self.cerveja.estilo {
//        case .indiaPaleAle:
//            return Text("🇮🇳  \(nomeEstilo)").foregroundColor(Color(UIColor(red: 0.21, green: 0.54, blue: 0.13, alpha: 1)))
//        case .americanIPA:
//            return Text("🇺🇸  \(nomeEstilo)").foregroundColor(.orange)
//        case .americanPaleAle:
//            return Text("🏈  \(nomeEstilo)").foregroundColor(.orange)
//        case .amberLager:
//            return Text("🟤  \(nomeEstilo)").foregroundColor(.orange)
//        case .witbier:
//            return Text("🌾  \(nomeEstilo)").foregroundColor(.orange)
//        case .pilsen:
//            return Text("🍺  \(nomeEstilo)").foregroundColor(.orange)
//        case .dunkel:
//            return Text("☕️  \(nomeEstilo)").foregroundColor(.orange)
//        default:
//            return Text(nomeEstilo).foregroundColor(.orange)
//        }
//    }
    
    func obterMediaAvaliacoes(_ avaliacoes: [Avaliacao]?) -> Int? {
        guard avaliacoes != nil else {
            return nil
        }
        var soma = 0
        for avaliacao in avaliacoes! {
            soma += avaliacao.nota
        }
        let media: Double = Double(soma) / Double(avaliacoes!.count)
        return Int(media)
    }
}
