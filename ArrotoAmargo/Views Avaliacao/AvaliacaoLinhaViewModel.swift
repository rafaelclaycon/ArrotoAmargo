//
//  AvaliacaoLinhaViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 22/07/20.
//

import Combine
import Foundation
import MapKit

class AvaliacaoLinhaViewModel: ObservableObject {
    var avaliacao: Avaliacao
    @Published var nota: Int
    @Published var dataHoraRegistro: String
    @Published var localRegistro: CLLocationCoordinate2D
    @Published var localConsumo: String
    @Published var anotacoes: String
    
    init(avaliacao: Avaliacao) {
        self.avaliacao = avaliacao
        
        self.nota = avaliacao.nota
        
        let dateFormatter = RelativeDateTimeFormatter()
        //dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss"
        //dateFormatter.dateStyle = .full
        //dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "pt_BR")
        self.dataHoraRegistro = dateFormatter.localizedString(for: avaliacao.dataHoraRegistro, relativeTo: Date())
        
        self.localRegistro = avaliacao.localRegistro
        self.localConsumo = avaliacao.localConsumo
        self.anotacoes = avaliacao.anotacoes
    }
}
