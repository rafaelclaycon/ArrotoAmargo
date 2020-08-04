//
//  NovaCervejaViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 03/08/20.
//

import Combine
import CoreLocation

class NovaCervejaViewModel: ObservableObject {
    @Published var estilos: [String] = []
    @Published var marcas: [String] = []
    @Published var cervejarias: [String] = []
    @Published var teorAlcoolico: Double = 0 {
        didSet {
            textoTeorAlcoolico = String(format: "%.1f", locale: Locale(identifier: "pt_BR"), self.teorAlcoolico) + "%"
        }
    }
    @Published var textoTeorAlcoolico: String = "0,0%"
    
    init() {
        for estilo in EstiloCerveja.allCases {
            estilos.append(estilo.rawValue)
        }
        
        let copiaMarcasOrdenadasAlfabeticamente = marcaDados.sorted {
            $0.nome.lowercased() < $1.nome.lowercased()
        }
        for marca in copiaMarcasOrdenadasAlfabeticamente {
            marcas.append(marca.nome)
        }
        
        let copiaCervejariasOrdenadasAlfabeticamente = cervejariaDados.sorted {
            $0.razaoSocial.lowercased() < $1.razaoSocial.lowercased()
        }
        for cervejaria in copiaCervejariasOrdenadasAlfabeticamente {
            cervejarias.append(cervejaria.razaoSocial)
        }
    }
}
