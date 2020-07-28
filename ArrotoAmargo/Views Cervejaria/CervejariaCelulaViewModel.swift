//
//  CervejariaCelulaViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 28/07/20.
//

import Combine
import SwiftUI
import CoreLocation

class CervejariaCelulaViewModel: ObservableObject {
    var cervejaria: Cervejaria
    @Published var imagem: Image
    @Published var nome: String
    @Published var endereco: String
    @Published var localizacao: CLLocationCoordinate2D
    
    init(cervejaria: Cervejaria) {
        self.cervejaria = cervejaria
        self.imagem = ImageStore.shared.image(name: cervejaria.nomeImagem)
        self.nome = cervejaria.nomeGrupo ?? cervejaria.nome
        self.endereco = cervejaria.endereco
        self.localizacao = cervejaria.localizacao
    }
}
