//
//  AvaliacaoLinha.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 22/07/20.
//

import SwiftUI

struct AvaliacaoLinha: View {
    
    @ObservedObject var viewModel = AvaliacaoLinhaViewModel()
    
    init(viewModel: AvaliacaoLinhaViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(avaliacaoVM.nota)
                    .font(.headline)
                Text(avaliacaoVM.dataHoraRegistro)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct AvaliacaoLinha_Previews: PreviewProvider {
    static var previews: some View {
        AvaliacaoLinha(avaliacao: avaliacaoDados[0].avaliacoes[0])
    }
}
