//
//  CervejaLinha.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 11/07/20.
//

import SwiftUI

struct CervejaLinha: View {
    @ObservedObject var viewModel: CervejaLinhaViewModel
    
    var body: some View {
        HStack {
            viewModel.imagem
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                        
            VStack(alignment: .leading) {
                Text(viewModel.nomeCerveja)
                    .font(.headline)
                    .padding(.bottom, 0.1)
                    .padding(.leading, 5)
                Text(viewModel.nomeCervejaria)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.leading, 5)
            }
            
            Spacer()
        }
    }
}

struct CervejaLinha_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CervejaLinha(viewModel: CervejaLinhaViewModel(cerveja: cervejaDados[0]))
            CervejaLinha(viewModel: CervejaLinhaViewModel(cerveja: cervejaDados[1]))
        }
        .previewLayout(.fixed(width: 350, height: 70))
    }
}
