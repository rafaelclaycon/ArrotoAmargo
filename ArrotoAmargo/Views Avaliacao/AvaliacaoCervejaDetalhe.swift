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
            MapView(coordinate: avaliacao.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 180)
            
            HStack {
                avaliacao.imagem.resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(avaliacao.nomeCerveja)
                    .font(.title)
                Spacer()
            }
            
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text(avaliacao.nomeFamiliaCerveja)
                        .font(.subheadline)
                    Spacer()
                    Text(avaliacao.nomeCervejaria)
                        .font(.subheadline)
                }
                Text("Nota: \(avaliacao.nota)")
                    .font(.body)
                    .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle(Text(avaliacao.nomeCerveja), displayMode: .inline)
    }
}

struct BeerDetail_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 11 Pro Max"], id: \.self) { deviceName in
            AvaliacaoCervejaDetalhe(avaliacao: avaliacaoDados[1])
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
