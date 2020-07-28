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
    
    init(avaliacao: Avaliacao) {
        self.avaliacao = avaliacao
        
        self.nota = avaliacao.nota
        
        let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss"
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "pt_BR")
        self.dataHoraRegistro = dateFormatter.string(from: avaliacao.dataHoraRegistro)
        
        self.localRegistro = avaliacao.localRegistro
    }
}
