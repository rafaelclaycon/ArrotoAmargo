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
        WindowGroup {
            AvaliacaoLista(preferencias: PreferenciasUsuario(tipoListaSelecionado: PreferenciasUsuario.TipoLista.cervejas))
        }
    }
}
