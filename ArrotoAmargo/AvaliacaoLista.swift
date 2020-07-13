//
//  AvaliacaoLista.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 12/07/20.
//

import SwiftUI

struct AvaliacaoLista: View {
    var body: some View {
        List(avaliacaoDados) { avaliacao in
            AvaliacaoCervejaLinha(avaliacaoCerveja: avaliacao)
        }
    }
}

struct AvaliacaoLista_Previews: PreviewProvider {
    static var previews: some View {
        AvaliacaoLista()
    }
}
