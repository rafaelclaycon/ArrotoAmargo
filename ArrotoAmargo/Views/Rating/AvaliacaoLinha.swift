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
//            Mapa(coordinate: viewModel.localRegistro)
//                .frame(width: 80, height: 80, alignment: .center)
            VStack(alignment: .leading) {
                Text(viewModel.dataHoraRegistro)
                    .font(.body)
                    .bold()
                    .padding(.bottom, 5)
                //Spacer()
                Text(viewModel.anotacoes)
                    .font(.body)
                    .foregroundColor(.gray)
                    //.padding()
            }
            .padding()
            Spacer()
            Text("Nota: \(viewModel.nota)")
                .bold()
                .padding()
        }
    }
}

struct AvaliacaoLinha_Previews: PreviewProvider {
    static var previews: some View {
        AvaliacaoLinha(viewModel: AvaliacaoLinhaViewModel(avaliacao: cervejaDados[0].avaliacoes![0]))
            .previewLayout(.fixed(width: 360, height: 78))
    }
}
