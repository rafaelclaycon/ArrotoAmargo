//
//  WatchCervejaDetalhe.swift
//  WatchArrotoAmargo Extension
//
//  Created by Rafael Claycon Schmitt on 13/08/20.
//

import SwiftUI

struct WatchCervejaDetalhe: View {
    @ObservedObject var viewModel: CervejaDetalheViewModel
    
    // TODO: Adaptar para a mudança para páginas.
    var body: some View {
        ScrollView {
            VStack {
                viewModel.imagem
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                /*Text(viewModel.nome)
                    .font(.title3)
                    .bold()*/
                viewModel.getTextoEstilo()
                    .font(.subheadline)
                    .bold()
                /*MedidorIBU(valor: viewModel.ibu)
                    .padding(.all, 20)*/
            }
        }
    }
}

struct WatchCervejaDetalhe_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WatchCervejaDetalhe(viewModel: CervejaDetalheViewModel(cerveja: cervejaDados[0]))
                .previewDevice("Apple Watch Series 5 - 40mm")
            WatchCervejaDetalhe(viewModel: CervejaDetalheViewModel(cerveja: cervejaDados[0]))
                .previewDevice("Apple Watch Series 5 - 44mm")
        }
    }
}
