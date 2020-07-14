//
//  BeerDetail.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 09/07/20.
//

import SwiftUI

struct AvaliacaoCervejaDetalhe: View {
    var avaliacao: AvaliacaoCerveja
    
    var body: some View {
        VStack {
            Image("IPA")
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text(avaliacao.nomeCerveja)
                    .font(.title)

                HStack(alignment: .top) {
                    Text(avaliacao.nomeFamiliaCerveja)
                        .font(.subheadline)
                    Spacer()
                    Text(avaliacao.nomeCervejaria)
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle(Text(avaliacao.nomeCerveja), displayMode: .inline)
    }
}

struct BeerDetail_Previews: PreviewProvider {
    static var previews: some View {
        AvaliacaoCervejaDetalhe(avaliacao: avaliacaoDados[1])
    }
}
