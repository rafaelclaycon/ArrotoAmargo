import Combine

class AvaliacaoListaViewModel: ObservableObject {

    var cerveja: Beer
    @Published var avaliacoes: [Avaliacao]?
    
    init(beer: Beer) {
        self.cerveja = beer
        self.avaliacoes = self.cerveja.avaliacoes
    }

}
