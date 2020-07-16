//
//  PreferenciasUsuario.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 16/07/20.
//

import Foundation

struct PreferenciasUsuario {
    var tipoListaSelecionado: TipoLista
    
    enum TipoLista: String, CaseIterable {
        case cervejas = "Cervejas"
        case diario = "Meu diário"
    }
}
