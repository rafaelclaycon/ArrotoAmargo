//
//  CervejaLinhaViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 01/08/20.
//

import Combine
import SwiftUI

class CervejaLinhaViewModel: ObservableObject {
    var cerveja: Cerveja
    @Published var nomeCerveja: String
    @Published var nomeCervejaria: String
    @Published var imagem: Image
    
    init(cerveja: Cerveja) {
        self.cerveja = cerveja
        self.nomeCerveja = cerveja.nome
        self.nomeCervejaria = cerveja.cervejaria!.razaoSocial.uppercased()
        self.imagem = cerveja.imagem
    }
}
