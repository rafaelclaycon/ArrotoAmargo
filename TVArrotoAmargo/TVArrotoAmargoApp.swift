//
//  TVArrotoAmargoApp.swift
//  TVArrotoAmargo
//
//  Created by Rafael Schmitt on 13/08/20.
//

import SwiftUI

@main
struct TVArrotoAmargoApp: App {
    var body: some Scene {
        WindowGroup {
            TVCervejaLista(viewModel: CervejaListaViewModel(cervejas: cervejaDados))
        }
    }
}
