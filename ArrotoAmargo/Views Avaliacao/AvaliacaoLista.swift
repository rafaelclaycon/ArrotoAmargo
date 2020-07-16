//
//  AvaliacaoLista.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 12/07/20.
//

import SwiftUI

struct AvaliacaoLista: View {
    var body: some View {
        NavigationView {
            List(avaliacaoDados) { avaliacao in
                NavigationLink(destination: AvaliacaoCervejaDetalhe(avaliacao: avaliacao)) {
                    AvaliacaoCervejaLinha(avaliacaoCerveja: avaliacao)
                }
            }
            .navigationBarTitle(Text("Cervejas"))
        }
    }
}

struct AvaliacaoLista_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (1st generation)", "iPhone SE (2nd generation)", "iPhone 11 Pro Max"], id: \.self) { deviceName in
            AvaliacaoLista()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
