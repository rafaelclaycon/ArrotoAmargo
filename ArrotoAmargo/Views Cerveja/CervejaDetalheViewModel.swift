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
    @Published var imagem: Image
    @Published var nomeFamiliaCerveja: String
    @Published var nomeCervejaria: String
    @Published var nota: Int
    @Published var ibu: Float
    @Published var teorAlcoolico: Float
    @Published var existemAvaliacoes: Bool
    @Published var avaliacoes: [Avaliacao]?
    
    init(cerveja: Cerveja) {
        self.cerveja = cerveja
        
        self.locationCoordinate = cerveja.locationCoordinate
        self.nome = cerveja.nome
        self.imagem = cerveja.imagem
        self.nomeFamiliaCerveja = cerveja.nomeFamiliaCerveja
        self.nomeCervejaria = cerveja.nomeCervejaria
        self.nota = cerveja.nota
        self.ibu = cerveja.ibu
        self.teorAlcoolico = cerveja.teorAlcoolico
        self.avaliacoes = cerveja.avaliacoes
        self.existemAvaliacoes = cerveja.avaliacoes != nil
    }
}
