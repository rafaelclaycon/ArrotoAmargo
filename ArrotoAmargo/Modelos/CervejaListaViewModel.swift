//
//  CervejaListaViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 21/07/20.
//

import Combine

class CervejaListaViewModel: ObservableObject {
    @Published var cervejas = avaliacaoDados
    
    func inicializar() {
        self.ordenarAlfabeticamentePeloNomeDaCerveja()
    }
    
    func ordenarAlfabeticamentePeloNomeDaCerveja() {
        cervejas.sort { $0.nome.lowercased() < $1.nome.lowercased() }
    }
    
    func ordenarPorNota() {
        cervejas.sort { $0.nota > $1.nota }
    }
    
    func ordenarPorIBU() {
        cervejas.sort { $0.ibu > $1.ibu }
    }
}
