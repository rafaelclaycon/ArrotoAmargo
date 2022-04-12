import Foundation

struct Marca: Hashable, Codable, Identifiable {

    var id: String
    var nome: String
    var idProprietario: String
    var idImagemLogo: String
    var enderecoSede: String

}
