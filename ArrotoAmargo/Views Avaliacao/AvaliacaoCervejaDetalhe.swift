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
            Mapa(coordinate: avaliacao.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 180)
            
            HStack {
                avaliacao.imagem.resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(avaliacao.nomeCerveja)
                    .font(.title)
                Spacer()
                MedidorNota(nota: avaliacao.nota)
                    .padding(.all, 20)
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Família: \(avaliacao.nomeFamiliaCerveja)")
                        .font(.body)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Text("Cervejaria: \(avaliacao.nomeCervejaria)")
                        .font(.body)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                Spacer()
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
