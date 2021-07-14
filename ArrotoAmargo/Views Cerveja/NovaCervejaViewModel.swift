//
//  NovaCervejaViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 03/08/20.
//

import Combine
import CoreLocation
import SwiftUI

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
    @Published var cores: [String] = []
    @Published var corSelecionada: UIColor = .systemPink
    //@State private var indiceCor = 0
    
    init() {
        //for estilo in EstiloCerveja.allCases {
            estilos.append("Nenhum")
        //}
        
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
        
        // Cor
//        for cor in CorCerveja.allCases {
//            cores.append(cor.rawValue)
//        }
    }
    
    func getCorSelecionada() -> UIColor {
        return UIColor.systemPink
//        switch self.indiceCor {
//        case 0:
//            return UIColor(displayP3Red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
//        default:
//            return UIColor.systemPink
//        }
    }
}
