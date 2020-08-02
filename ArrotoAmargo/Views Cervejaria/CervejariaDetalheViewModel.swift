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
    @Published var localizacao: CLLocationCoordinate2D
    
    init(cervejaria: Cervejaria) {
        self.cervejaria = cervejaria
        self.nomeCervejaria = cervejaria.razaoSocial
        self.endereco = cervejaria.endereco
        self.localizacao = cervejaria.localizacao
    }
}
