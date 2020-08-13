//
//  ArrotoAmargoApp.swift
//  WatchArrotoAmargo Extension
//
//  Created by Rafael Claycon Schmitt on 13/08/20.
//

import SwiftUI

@main
struct ArrotoAmargoApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                WatchCervejaDetalhe(viewModel: CervejaDetalheViewModel(cerveja: cervejaDados[0]))
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
