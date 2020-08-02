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
    @Published var locationCoordinate: CLLocationCoordinate2D
    @Published var nome: String
    @Published var nomeEstilo: String
    @Published var imagem: Image
    @Published var cervejaria: Cervejaria
    @Published var marca: Marca
    @Published var nota: Int?
    @Published var ibu: Int
    @Published var teorAlcoolico: Float
    @Published var existemAvaliacoes: Bool
    @Published var avaliacoes: [Avaliacao]?
    @Published var existemFotosUsuario: Bool
    
    init(cerveja: Cerveja) {
        self.cerveja = cerveja
        
        self.locationCoordinate = cerveja.locationCoordinate
        self.nome = cerveja.nome
        self.nomeEstilo = cerveja.estilo.rawValue.uppercased()
        self.imagem = cerveja.imagem
        self.cervejaria = cerveja.cervejaria!
        self.marca = cerveja.marca!
        self.nota = cerveja.nota
        self.ibu = Int(round(cerveja.ibu))
        self.teorAlcoolico = cerveja.teorAlcoolico
        self.avaliacoes = cerveja.avaliacoes
        self.existemAvaliacoes = cerveja.avaliacoes != nil
        self.existemFotosUsuario = cerveja.fotosUsuario != nil
    }
    
    func primeiraFoto() -> Image {
        return ImageStore.shared.image(name: cerveja.fotosUsuario![0])
    }
    
    func getTeorAlcoolicoTexto() -> String {
        return String(format: "%.1f", locale: Locale(identifier: "pt_BR"), self.teorAlcoolico) + "%"
    }
    
    func getTextoEstilo() -> Text {
        switch self.cerveja.estilo {
        case .indiaPaleAle:
            return Text("🇮🇳  \(nomeEstilo)").foregroundColor(Color(UIColor(red: 0.21, green: 0.54, blue: 0.13, alpha: 1)))
        case .americanIPA:
            return Text("🇺🇸  \(nomeEstilo)").foregroundColor(.orange)
        case .americanPaleAle:
            return Text("🏈  \(nomeEstilo)").foregroundColor(.orange)
        case .amberLager:
            return Text("🟤  \(nomeEstilo)").foregroundColor(.orange)
        case .witbier:
            return Text("🌾  \(nomeEstilo)").foregroundColor(.orange)
        case .pilsen:
            return Text("🍺  \(nomeEstilo)").foregroundColor(.orange)
        case .dunkel:
            return Text("☕️  \(nomeEstilo)").foregroundColor(.orange)
        default:
            return Text(nomeEstilo).foregroundColor(.orange)
        }
    }
}
