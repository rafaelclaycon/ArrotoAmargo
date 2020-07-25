//
//  AvaliacaoLinha.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 22/07/20.
//

import SwiftUI

struct AvaliacaoLinha: View {
    @ObservedObject var viewModel: AvaliacaoLinhaViewModel
    
    init(viewModel: AvaliacaoLinhaViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            Mapa(coordinate: viewModel.localRegistro)
                .frame(width: 80, height: 80, alignment: .center)
            VStack(alignment: .leading) {
                Text(viewModel.dataHoraRegistro)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding()
            }
            Spacer()
            MedidorNota(nota: viewModel.nota)
                .padding()
        }
    }
}

struct AvaliacaoLinha_Previews: PreviewProvider {
    static var previews: some View {
        AvaliacaoLinha(viewModel: AvaliacaoLinhaViewModel(avaliacao: avaliacaoDados[0].avaliacoes![0]))
    }
}