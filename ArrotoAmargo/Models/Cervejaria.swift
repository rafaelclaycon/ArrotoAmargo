import Foundation
import CoreLocation

struct Cervejaria: Hashable, Codable, Identifiable {

    // Cervejaria, do ponto de vista do Arroto Amargo, é a empresa que produziu e envasou a cerveja.
    
    var id: String
    var razaoSocial: String
    var idLocal: String

}
