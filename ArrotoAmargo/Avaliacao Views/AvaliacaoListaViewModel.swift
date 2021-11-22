//
//  AvaliacaoListaViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 22/07/20.
//

import Combine

class AvaliacaoListaViewModel: ObservableObject {
    var cerveja: Cerveja
    @Published var avaliacoes: [Avaliacao]?
    
    init(cerveja: Cerveja) {
        self.cerveja = cerveja
        self.avaliacoes = self.cerveja.avaliacoes
    }
}
