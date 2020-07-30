//
//  CervejariaCelula.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 25/07/20.
//

import SwiftUI
import CoreLocation

struct CervejariaCelula: View {
    @ObservedObject var viewModel: CervejariaCelulaViewModel
    
    var body: some View {
        HStack {
            viewModel.imagem
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50, alignment: .center)
                .padding(.leading, 20)
                
            VStack(alignment: .leading) {
                Text(viewModel.nome)
                    .font(.title3)
                    .bold()
                    //.padding()
                Spacer()
                Text(viewModel.endereco)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    //.padding()
            }
            .padding()
            Spacer()
            Mapa(coordinate: viewModel.localizacao)
                .frame(width: 80, height: 78, alignment: .trailing)
        }
    }
}

struct CervejariaCelula_Previews: PreviewProvider {
    static var previews: some View {
        CervejariaCelula(viewModel: CervejariaCelulaViewModel(cervejaria: cervejariaDados[0]))
            .previewLayout(.fixed(width: 360, height: 78))
    }
}
