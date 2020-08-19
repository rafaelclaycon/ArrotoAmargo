//
//  NovaAvaliacaoViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 02/08/20.
//

import Combine
import Foundation

class NovaAvaliacaoViewModel: ObservableObject {
    @Published var cervejas: [String] = []
    @Published var indiceCerveja = 0
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
    @Published var veioTelaDetalheCerveja: Bool = false
    @Published var descricaoLocal: String = ""
    @Published var anotacoes: String = ""
    @Published var dataRegistro = Date()
    @Published var usarLocalizacaoAtual: Bool = true
    private var idCerveja: Int? = nil
    
    init(nomeCerveja: String?, idCerveja: Int?) {
        let copiaCervejasOrdenadasAlfabeticamente = cervejaDados.sorted {
            $0.nome.lowercased() < $1.nome.lowercased()
        }
        for cerveja in copiaCervejasOrdenadasAlfabeticamente {
            cervejas.append(cerveja.nome)
        }
        if nomeCerveja != nil {
            self.indiceCerveja = cervejas.firstIndex(of: nomeCerveja!) ?? 0
        }
        self.veioTelaDetalheCerveja = nomeCerveja != nil
        self.idCerveja = idCerveja
    }
    
    func salvarAvaliacao() {
        guard idCerveja != nil else {
            fatalError("idCerveja não especificado!")
        }
        guard let indice = cervejaDados.firstIndex(where: {$0.id == idCerveja}) else {
            fatalError("Índice não encontrado para ID: \(String(describing: idCerveja))")
        }
        
        if cervejaDados[indice].avaliacoes != nil {
            print("Cerveja: \(cervejaDados[indice].nome)")
            print("Count avaliações antes da adição: \(cervejaDados[indice].avaliacoes!.count)")
            cervejaDados[indice].avaliacoes!.append(Avaliacao(dataHora: dataRegistro, nota: nota, localConsumo: descricaoLocal, anotacoes: anotacoes, localRegistroLatitude: -122.029620, localRegistroLongitude: 37.332104))
            print("Count avaliações depois da adição: \(cervejaDados[indice].avaliacoes!.count)")
        } else {
            print("Array de avaliações era nil para \(cervejaDados[indice].nome).")
        }
    }
}
