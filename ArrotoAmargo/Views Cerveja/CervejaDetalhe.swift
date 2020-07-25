//
//  CervejaDetalhe.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 09/07/20.
//

import SwiftUI

struct CervejaDetalhe: View {
    var cerveja: Cerveja
    
    var body: some View {
        ScrollView {
            VStack {
                Mapa(coordinate: cerveja.locationCoordinate)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 180)
                
                HStack {
                    cerveja.imagem.resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                    Text(cerveja.nome)
                        .font(.title)
                    Spacer()
                    MedidorNota(nota: cerveja.nota)
                        .padding(.all, 20)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Família: \(cerveja.nomeFamiliaCerveja)")
                            .font(.body)
                            .padding(.all, 10)
                        Text("Cervejaria: \(cerveja.nomeCervejaria)")
                            .font(.body)
                            .padding(.all, 10)
                    }
                    Spacer()
                }
                .padding()
                
                MedidorIBU(valor: cerveja.ibu)
                    .padding(.all, 20)
                
                VStack(alignment: .leading) {
                    Text("Avaliações")
                        .font(.title2)
                        .padding()
                    
                    ForEach(cerveja.avaliacoes!) { avaliacao in
                        AvaliacaoLinha(viewModel: AvaliacaoLinhaViewModel(avaliacao: avaliacao))
                            .background(Color.yellow)
                    }
                }
            }
            .navigationBarTitle(Text(cerveja.nome), displayMode: .inline)
        }
    }
}

struct BeerDetail_Previews: PreviewProvider {
    // iPad Air (3rd generation)
    static var previews: some View {
        ForEach(["iPhone SE (1st generation)", "iPhone SE (2nd generation)", "iPhone 11 Pro Max"], id: \.self) { deviceName in
            CervejaDetalhe(cerveja: avaliacaoDados[1])
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
