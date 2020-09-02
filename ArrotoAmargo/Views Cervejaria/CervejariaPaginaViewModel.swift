//
//  CervejariaPaginaViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 28/08/20.
//

import Combine

class CervejariaPaginaViewModel: ObservableObject {
    @Published var cervejaria: Cervejaria
    @Published var marca: Marca
    
    init(cervejaria: Cervejaria, marca: Marca) {
        self.cervejaria = cervejaria
        self.marca = marca
    }
}
