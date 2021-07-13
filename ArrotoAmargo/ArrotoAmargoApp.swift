//
//  ArrotoAmargoApp.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 08/07/20.
//

import SwiftUI

@main
struct ArrotoAmargoApp: App {

    var body: some Scene {
        let cervejaria = Cervejaria(id: "pppp", razaoSocial: "Campo Bom Ltda", cidade: "Campo Bom", uf: "RS", pais: "Brasil")
        
        let cerveja = Cerveja(id: "ABCD",
                              nome: "Teste",
                              nota: 0,
                              ibu: 2.0,
                              teorAlcoolico: 3.0,
                              estilo: EstiloCerveja(rawValue: "American Pale Ale")!,
                              cor: 4.0,
                              dataAdicao: Date(),
                              imagem: Imagem(id: "defg", caminho: ""),
                              cervejaria: cervejaria,
                              marca: Marca(id: "erfg", nome: "Bellavista", fabricas: [cervejaria], proprietario: Proprietario(id: "dddd", nome: "Fruki")),
                              avaliacoes: nil)
        
        WindowGroup {
            CervejaLista(viewModel: CervejaListaViewModel(cervejas: [cerveja]))
        }
    }

}
