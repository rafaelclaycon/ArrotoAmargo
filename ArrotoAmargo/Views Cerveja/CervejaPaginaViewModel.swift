//
//  CervejaPaginaViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 29/08/20.
//

import Combine
import Foundation

class CervejaPaginaViewModel: ObservableObject {
    @Published var ibu: Int
    @Published var teorAlcoolico: Float
    
    init(ibu: Int, teorAlcoolico: Float) {
        self.ibu = ibu
        self.teorAlcoolico = teorAlcoolico
    }
    
    func getTeorAlcoolicoTexto() -> String {
        return String(format: "%.1f", locale: Locale(identifier: "pt_BR"), self.teorAlcoolico) + "%"
    }
}
