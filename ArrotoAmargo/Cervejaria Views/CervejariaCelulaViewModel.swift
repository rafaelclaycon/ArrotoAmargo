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
    var marca: Marca
    //@Published var logoCervejaria: Image
    @Published var nomeCervejaria: String
    @Published var endereco: String
    //@Published var localizacao: CLLocationCoordinate2D
    @Published var nomeMarca: String
    @Published var nomeProprietarioMarca: String
    
    init(cervejaria: Cervejaria, marca: Marca) {
        self.cervejaria = cervejaria
        self.marca = marca
        //self.logoCervejaria = ImageStore.shared.image(name: marca.nomeImagem)
        self.nomeCervejaria = cervejaria.razaoSocial
        self.endereco = ""
        //self.localizacao = cervejaria.localizacao
        self.nomeMarca = marca.nome
        self.nomeProprietarioMarca = ""
    }
    
    func getCervejaria() -> Cervejaria {
        return cervejaria
    }
}
