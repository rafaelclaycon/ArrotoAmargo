//
//  CervejaPaginaViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 29/08/20.
//

import Combine
import Foundation

class CervejaPaginaViewModel: ObservableObject {
    @Published var cervejaria: Cervejaria
    @Published var marca: Marca
    @Published var ibu: Int
    @Published var teorAlcoolico: Float
    
    init(cervejaria: Cervejaria, marca: Marca, ibu: Int, teorAlcoolico: Float) {
        self.cervejaria = cervejaria
        self.marca = marca
        self.ibu = ibu
        self.teorAlcoolico = teorAlcoolico
    }
    
    func getTeorAlcoolicoTexto() -> String {
        return String(format: "%.1f", locale: Locale(identifier: "pt_BR"), self.teorAlcoolico) + "%"
    }
}
