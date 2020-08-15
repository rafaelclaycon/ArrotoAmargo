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
    @Published var existeFoto: Bool
    
    init(cerveja: Cerveja) {
        self.cerveja = cerveja
        self.nomeCerveja = cerveja.nome
        self.nomeCervejaria = cerveja.cervejaria!.razaoSocial.uppercased()
        self.imagem = cerveja.imagem
        self.existeFoto = cerveja.fotosUsuario != nil
    }
    
    func primeiraFoto() -> Image {
        return ImageStore.shared.image(name: cerveja.fotosUsuario![0])
    }
}
