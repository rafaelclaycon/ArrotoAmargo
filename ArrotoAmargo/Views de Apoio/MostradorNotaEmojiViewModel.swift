//
//  MostradorNotaEmojiViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 10/08/20.
//

import Combine

class MostradorNotaEmojiViewModel: ObservableObject {
    var nota: Int {
        didSet {
            switch nota {
            case 1:
                opacidadePrimeiro = 1.0
                opacidadeSegundo = 0.4
                opacidadeTerceiro = 0.4
                opacidadeQuarto = 0.4
                opacidadeQuinto = 0.4
            case 2:
                opacidadePrimeiro = 1.0
                opacidadeSegundo = 1.0
                opacidadeTerceiro = 0.4
                opacidadeQuarto = 0.4
                opacidadeQuinto = 0.4
            case 3:
                opacidadePrimeiro = 1.0
                opacidadeSegundo = 1.0
                opacidadeTerceiro = 1.0
                opacidadeQuarto = 0.4
                opacidadeQuinto = 0.4
            case 4:
                opacidadePrimeiro = 1.0
                opacidadeSegundo = 1.0
                opacidadeTerceiro = 1.0
                opacidadeQuarto = 1.0
                opacidadeQuinto = 0.4
            case 5:
                opacidadePrimeiro = 1.0
                opacidadeSegundo = 1.0
                opacidadeTerceiro = 1.0
                opacidadeQuarto = 1.0
                opacidadeQuinto = 1.0
            default:
                opacidadePrimeiro = 0.4
                opacidadeSegundo = 0.4
                opacidadeTerceiro = 0.4
                opacidadeQuarto = 0.4
                opacidadeQuinto = 0.4
            }
        }
    }
    @Published var opacidadePrimeiro: Double = 0.4
    @Published var opacidadeSegundo: Double = 0.4
    @Published var opacidadeTerceiro: Double = 0.4
    @Published var opacidadeQuarto: Double = 0.4
    @Published var opacidadeQuinto: Double = 0.4
    
    init(nota: Int) {
        self.nota = nota
    }
}
