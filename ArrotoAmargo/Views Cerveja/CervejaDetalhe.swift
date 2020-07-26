//
//  CervejaDetalhe.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 09/07/20.
//

import SwiftUI

struct CervejaDetalhe: View {
    @ObservedObject var viewModel: CervejaDetalheViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Mapa(coordinate: viewModel.locationCoordinate)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 180)
                
                HStack {
                    viewModel.imagem.resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                    Text(viewModel.nome)
                        .font(.title)
                        .bold()
                    Spacer()
                    MedidorNota(nota: viewModel.nota)
                        .padding(.all, 20)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Família: \(viewModel.nomeFamiliaCerveja)")
                            .font(.body)
                            .padding(.all, 10)
                        Text("Cervejaria:")
                            .font(.body)
                            .padding(.all, 10)
                        CervejariaCelula()
                            .background(Color.white)
                            .cornerRadius(14)
                            .shadow(color: .gray, radius: 3, x: 0.0, y: 2)
                            .padding(.horizontal, 15)
                    }
                    Spacer()
                }
                .padding()
                
                MedidorIBU(valor: viewModel.ibu)
                    .padding(.all, 20)
                
                if viewModel.existemAvaliacoes {
                    VStack(alignment: .leading) {
                        Text("Avaliações")
                            .font(.title2)
                            .bold()
                            .padding()
                        
                        ForEach(viewModel.avaliacoes!) { avaliacao in
                            AvaliacaoLinha(viewModel: AvaliacaoLinhaViewModel(avaliacao: avaliacao))
                                .background(Color.yellow)
                                .frame(height: 50)
                        }
                    }
                } else {
                    Spacer()
                    Text("Não existem avaliações para essa cerveja.")
                }
            }
            .navigationBarTitle(Text(viewModel.nome), displayMode: .inline)
        }
    }
}

struct CervejaDetalhe_Previews: PreviewProvider {
    // iPhone SE (1st generation)
    // iPhone SE (2nd generation)
    // iPad Air (3rd generation)
    static var previews: some View {
        ForEach(["iPhone 11 Pro Max"], id: \.self) { deviceName in
            CervejaDetalhe(viewModel: CervejaDetalheViewModel(cerveja: avaliacaoDados[1])) 
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
