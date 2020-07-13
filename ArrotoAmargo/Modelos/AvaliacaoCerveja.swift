//
//  AvaliacaoCerveja.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 09/07/20.
//

import SwiftUI

struct AvaliacaoCerveja: Hashable, Codable {
    var nomeCerveja: String
    fileprivate var nomeImagem: String
    var nomeFamiliaCerveja: String
    var nomeCervejaria: String
    var nota: Int
}

extension AvaliacaoCerveja {
    var image: Image {
        ImageStore.shared.image(name: nomeImagem)
    }
}
