//
//  CervejariaDetalhe.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 01/08/20.
//

import SwiftUI

struct CervejariaDetalhe: View {
    @ObservedObject var viewModel: CervejariaDetalheViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Mapa(coordinate: viewModel.localizacao/*, span: 0.005*/)
                //.edgesIgnoringSafeArea(.top)
                .frame(height: 200)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(viewModel.nomeCervejaria)
                        .font(.title2)
                        .bold()
                        .accessibility(identifier: UIID.nomeCervejaTitulo)
                        .padding(.bottom, 6)
                        .padding(.leading, 20)
                        .padding(.top, 10)
                    Text(viewModel.endereco)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.leading, 20)
                }
                Spacer()
            }
            .padding(.bottom, 15)
            
            Text("CERVEJAS PRODUZIDAS POR ESSA CERVEJARIA:")
                .font(.subheadline)
                .bold()
                .foregroundColor(.gray)
                .padding(.leading, 20)
                .padding(.bottom, 10)
            
            ForEach(viewModel.cervejas) { cerveja in
                CervejaLinha(viewModel: CervejaLinhaViewModel(cerveja: cerveja))
            }
            .padding(.horizontal, 15)
        }
    }
}

struct CervejariaDetalhe_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 11"], id: \.self) { deviceName in
            CervejariaDetalhe(viewModel: CervejariaDetalheViewModel(cervejaria: cervejariaDados[0]))
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
