//
//  Local.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 21/11/21.
//

import Foundation
import CoreLocation

struct Local: Hashable, Codable, Identifiable {
    
    var id: String
    var latitude: Double
    var longitude: Double
    var cidade: String
    var uf: String
    var pais: String
    
    fileprivate var coordenadas: Coordinates

    var localizacao: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordenadas.latitude,
            longitude: coordenadas.longitude)
    }

}
