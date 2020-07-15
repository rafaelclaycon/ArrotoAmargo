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
        HStack {
            avaliacaoCerveja.imagem
                .resizable()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(avaliacaoCerveja.nomeCerveja)
            Spacer()
        }
    }
}

struct AvaliacaoCervejaLinha_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AvaliacaoCervejaLinha(avaliacaoCerveja: avaliacaoDados[0])
            AvaliacaoCervejaLinha(avaliacaoCerveja: avaliacaoDados[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
