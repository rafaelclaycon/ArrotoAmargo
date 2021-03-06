//
//  Cervejaria.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 25/07/20.
//

import Foundation
import CoreLocation

struct Cervejaria: Hashable, Codable, Identifiable {
    
    // Cervejaria, do ponto de vista do Arroto Amargo, é a empresa que produziu e envasou a cerveja.
    
    var id: String
    var razaoSocial: String
    var cidade: String
    var uf: String
    var pais: String
    
//    fileprivate var coordenadas: Coordinates
//    
//    var localizacao: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(
//            latitude: coordenadas.latitude,
//            longitude: coordenadas.longitude)
//    }

}
