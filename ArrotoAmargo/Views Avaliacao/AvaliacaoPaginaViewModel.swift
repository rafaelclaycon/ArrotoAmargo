//
//  AvaliacaoPaginaViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 26/08/20.
//

import Combine

class AvaliacaoPaginaViewModel: ObservableObject {
    @Published var existemAvaliacoes: Bool
    @Published var avaliacoes: [Avaliacao]?
    @Published var idCerveja: Int
    @Published var nome: String
    
    init(avaliacoes: [Avaliacao]?, idCerveja: Int, nomeCerveja: String) {
        self.avaliacoes = avaliacoes
        self.existemAvaliacoes = avaliacoes != nil
        self.idCerveja = idCerveja
        self.nome = nomeCerveja
    }
    
    func atualizarListaAvaliacoes() {
        if let cervejaEncontrada = cervejaDados.first(where: {$0.id == idCerveja}) {
            self.avaliacoes = cervejaEncontrada.avaliacoes?.sorted(by: { $0.dataHoraRegistro > $1.dataHoraRegistro })
        } else {
            print("Cerveja não encontrada! Lista de avaliações não será atualizada!")
        }
    }
}
