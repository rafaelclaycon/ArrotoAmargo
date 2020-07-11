//
//  AvaliacaoCervejaLinha.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 11/07/20.
//

import SwiftUI

struct AvaliacaoCervejaLinha: View {
    var avaliacaoCerveja: AvaliacaoCerveja
    
    var body: some View {
        Text(avaliacaoCerveja.nomeCerveja)
    }
}

struct AvaliacaoCervejaLinha_Previews: PreviewProvider {
    static var previews: some View {
        AvaliacaoCervejaLinha(avaliacaoCerveja: cervejaDados[0])
    }
}
