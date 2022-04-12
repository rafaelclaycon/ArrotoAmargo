//
//  CervejariaDetalheViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 01/08/20.
//

import Combine
import SwiftUI
import CoreLocation

class CervejariaDetalheViewModel: ObservableObject {
    var cervejaria: Cervejaria
    @Published var nomeCervejaria: String
    @Published var endereco: String
    //@Published var localizacao: CLLocationCoordinate2D
    //@Published var cervejas: [Cerveja]
    
    init(cervejaria: Cervejaria) {
        self.cervejaria = cervejaria
        self.nomeCervejaria = cervejaria.razaoSocial
        self.endereco = ""
        //self.localizacao = cervejaria.localizacao
//        self.cervejas = cervejaDados.filter { cerveja in
//            return cerveja.idCervejaria == cervejaria.id
//        }
        //self.cervejas.sort { $0.nome.lowercased() < $1.nome.lowercased() }
    }
}
