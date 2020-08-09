//
//  NovaAvaliacaoViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 02/08/20.
//

import Combine

class NovaAvaliacaoViewModel: ObservableObject {
    //var avaliacao: Avaliacao?
    @Published var cervejas: [String] = []
    @Published var nota: Int = 0 {
        didSet {
            switch nota {
            case 1:
                textoNota = "😖"
            case 2:
                textoNota = "😖  😬"
            case 3:
                textoNota = "😖  😬  🧐"
            case 4:
                textoNota = "😖  😬  🧐  😌"
            case 5:
                textoNota = "😖  😬  🧐  😌  😍"
            default:
                textoNota = ""
            }
        }
    }
    @Published var textoNota: String = ""
    
    init() {
        let copiaCervejasOrdenadasAlfabeticamente = cervejaDados.sorted {
            $0.nome.lowercased() < $1.nome.lowercased()
        }
        for cerveja in copiaCervejasOrdenadasAlfabeticamente {
            cervejas.append(cerveja.nome)
        }
    }
}
