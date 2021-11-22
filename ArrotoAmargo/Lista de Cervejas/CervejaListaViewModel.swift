//
//  CervejaListaViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 21/07/20.
//

import Combine
import SwiftUI

class CervejaListaViewModel: ObservableObject {
    @Published var cervejas: [Cerveja]
    @Published var exibindoOpcoesOrdenacao = false
    @Published var exibindoOpcoesCriacao = false
    @Published var exibindoModal = false
    @Published var exibirCadastroAvaliacao = false
    @Published var exibirCadastroCerveja = false
    @Published var exibirCadastroCervejaria = false
    
    init(cervejas: [Cerveja]) {
        self.cervejas = cervejas
        self.ordenarAlfabeticamentePeloNomeDaCerveja()
    }
    
    func ordenarAlfabeticamentePeloNomeDaCerveja() {
        cervejas.sort { $0.nome.lowercased() < $1.nome.lowercased() }
    }
    
    func ordenarPorNota() {
        cervejas.sort { $0.nota ?? 0 > $1.nota ?? 0 }
    }
    
    func ordenarPorIBU() {
        cervejas.sort { $0.ibu > $1.ibu }
    }
    
    func ordenarPorDataAdicao() {
        cervejas.sort { $0.dataAdicao > $1.dataAdicao }
    }
    
    func exibirCadastroNovaAvaliacao() {
        self.exibindoOpcoesCriacao = false
        
        self.exibirCadastroAvaliacao = true
        self.exibirCadastroCerveja = false
        self.exibirCadastroCervejaria = false
        
        self.exibindoModal = true
    }
    
    func exibirCadastroNovaCerveja() {
        self.exibindoOpcoesCriacao = false
        
        self.exibirCadastroAvaliacao = false
        self.exibirCadastroCerveja = true
        self.exibirCadastroCervejaria = false
        
        self.exibindoModal = true
    }
    
    func exibirCadastroNovaCevejaria() {
        self.exibindoOpcoesCriacao = false
        
        self.exibirCadastroAvaliacao = false
        self.exibirCadastroCerveja = false
        self.exibirCadastroCervejaria = true
        
        self.exibindoModal = true
    }
    
    func getActionSheetOrdenacao() -> ActionSheet {
        ActionSheet(title: Text("Reordenar lista"),
            message: Text("Escolha uma propriedade da cerveja para reordernar a lista."),
            buttons: [.default(Text("🔠  Nome (A → Z)")) { self.ordenarAlfabeticamentePeloNomeDaCerveja() },
                      .default(Text("🥇  Nota (5 → 0)")) { self.ordenarPorNota() },
                      .default(Text("📆  Data de adição")) { self.ordenarPorDataAdicao() },
                      .default(Text("😖  IBU (amargor)")) { self.ordenarPorIBU() },
                      .cancel(Text("Cancelar"))])
    }
}
