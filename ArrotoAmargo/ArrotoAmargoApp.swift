import SwiftUI

@main
struct ArrotoAmargoApp: App {

    var body: some Scene {
        
        
        let cervejaria = Cervejaria(id: "pppp", razaoSocial: "Campo Bom Ltda", idLocal: "")
        
        let beer = Beer(id: "ABCD",
                        nome: "Teste",
                        nota: 0,
                        ibu: 2.0,
                        teorAlcoolico: 3.0,
                        estilo: BeerStyle(id: "1", nome: "American Pale Ale"),
                        cor: 4.0,
                        dataAdicao: Date(),
                        imagem: Imagem(id: "defg", caminho: ""),
                        cervejaria: cervejaria,
                        marca: Marca(id: "3C4A5608-AD5F-4183-95B0-F023BC21935A", nome: "Imigração", idProprietario: "A9B12804-38EB-4CAE-8D7E-F578663E846F", idImagemLogo: "logo_imigracao", enderecoSede: "Campo Bom - RS, Brasil"),
                        avaliacoes: nil)
        
        WindowGroup {
            CervejaLista(viewModel: BeerListViewModel(cervejas: [beer]))
        }
    }

}
