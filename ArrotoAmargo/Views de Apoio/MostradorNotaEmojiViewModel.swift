//
//  MostradorNotaEmojiViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 10/08/20.
//

import Combine

class MostradorNotaEmojiViewModel: ObservableObject {
    var nota: Int
    @Published var opacidadePrimeiro: Double = 0.4
    @Published var opacidadeSegundo: Double = 0.4
    @Published var opacidadeTerceiro: Double = 0.4
    @Published var opacidadeQuarto: Double = 0.4
    @Published var opacidadeQuinto: Double = 0.4
    
    private let apagado = 0.25
    private let metade = 0.65
    private let totalmenteVisivel = 1.0
    
    init(nota: Int) {
        self.nota = nota
        
        switch nota {
        case 1:
            opacidadePrimeiro = metade
            opacidadeSegundo = apagado
            opacidadeTerceiro = apagado
            opacidadeQuarto = apagado
            opacidadeQuinto = apagado
        case 2:
            opacidadePrimeiro = totalmenteVisivel
            opacidadeSegundo = apagado
            opacidadeTerceiro = apagado
            opacidadeQuarto = apagado
            opacidadeQuinto = apagado
        case 3:
            opacidadePrimeiro = totalmenteVisivel
            opacidadeSegundo = metade
            opacidadeTerceiro = apagado
            opacidadeQuarto = apagado
            opacidadeQuinto = apagado
        case 4:
            opacidadePrimeiro = totalmenteVisivel
            opacidadeSegundo = totalmenteVisivel
            opacidadeTerceiro = apagado
            opacidadeQuarto = apagado
            opacidadeQuinto = apagado
        case 5:
            opacidadePrimeiro = totalmenteVisivel
            opacidadeSegundo = totalmenteVisivel
            opacidadeTerceiro = metade
            opacidadeQuarto = apagado
            opacidadeQuinto = apagado
        case 6:
            opacidadePrimeiro = totalmenteVisivel
            opacidadeSegundo = totalmenteVisivel
            opacidadeTerceiro = totalmenteVisivel
            opacidadeQuarto = apagado
            opacidadeQuinto = apagado
        case 7:
            opacidadePrimeiro = totalmenteVisivel
            opacidadeSegundo = totalmenteVisivel
            opacidadeTerceiro = totalmenteVisivel
            opacidadeQuarto = metade
            opacidadeQuinto = apagado
        case 8:
            opacidadePrimeiro = totalmenteVisivel
            opacidadeSegundo = totalmenteVisivel
            opacidadeTerceiro = totalmenteVisivel
            opacidadeQuarto = totalmenteVisivel
            opacidadeQuinto = apagado
        case 9:
            opacidadePrimeiro = totalmenteVisivel
            opacidadeSegundo = totalmenteVisivel
            opacidadeTerceiro = totalmenteVisivel
            opacidadeQuarto = totalmenteVisivel
            opacidadeQuinto = metade
        case 10:
            opacidadePrimeiro = totalmenteVisivel
            opacidadeSegundo = totalmenteVisivel
            opacidadeTerceiro = totalmenteVisivel
            opacidadeQuarto = totalmenteVisivel
            opacidadeQuinto = totalmenteVisivel
        default:
            opacidadePrimeiro = apagado
            opacidadeSegundo = apagado
            opacidadeTerceiro = apagado
            opacidadeQuarto = apagado
            opacidadeQuinto = apagado
        }
    }
    
    func getFraseEngracadinha() -> String {
        switch nota {
        case 1:
            return "SUQUINHO DE MILHO"
        case 2:
            return "SUQUINHO DE MILHO"
        case 3:
            return "NÃO VALEU OS PILA"
        case 4:
            return "NÃO VALEU OS PILA"
        case 5:
            return "HMMMM"
        case 6:
            return "HMMMM"
        case 7:
            return "UMA DELÍCIA"
        case 8:
            return "UMA DELÍCIA"
        case 9:
            return "HITOU!"
        case 10:
            return "HITOU!"
        default:
            return ""
        }
    }
}
