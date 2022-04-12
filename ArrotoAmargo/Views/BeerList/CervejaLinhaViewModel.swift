import Combine
import SwiftUI

class CervejaLinhaViewModel: ObservableObject {

    var cerveja: Beer
    @Published var nomeCerveja: String
    @Published var nomeCervejaria: String
    //@Published var imagem: Image
    //@Published var existeFoto: Bool
    
    init(cerveja: Beer) {
        self.cerveja = cerveja
        self.nomeCerveja = cerveja.nome
        self.nomeCervejaria = cerveja.cervejaria?.razaoSocial.uppercased() ?? ""
        //self.imagem = cerveja.imagem
        //self.existeFoto = cerveja.fotosUsuario != nil
    }
    
//    func primeiraFoto() -> Image {
//        return ImageStore.shared.image(name: cerveja.fotosUsuario![0])
//    }

}
