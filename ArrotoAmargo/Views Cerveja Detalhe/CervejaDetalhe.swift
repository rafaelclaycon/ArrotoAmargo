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
                if viewModel.existemFotosUsuario {
                    viewModel.primeiraFoto()
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 180)
                        .clipped()
                } else {
                    Mapa(coordinate: viewModel.locationCoordinate)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 180)
                }
                
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
                        Text("Cervejaria:")
                            .font(.body)
                            .padding(.all, 10)
                        CervejariaCelula(viewModel: CervejariaCelulaViewModel(cervejaria: viewModel.cervejaria))
                            .background(Color.white)
                            .cornerRadius(14)
                            .shadow(color: .gray, radius: 3, x: 0.0, y: 2)
                            .padding(.horizontal, 15)
                    }
                    Spacer()
                }
                .padding()
                
                HStack() {
                    MedidorIBU(valor: viewModel.ibu)
                        .padding(.all, 20)
                    
                    MostradorTeorAlcoolico(valor: 8.1, texto: "8,1%")
                        .frame(width: 200, height: 80, alignment: .center)
                        //.background(Color.yellow)
                }
                .padding()
                
                HStack() {
                    Text("Avaliações")
                        .font(.title2)
                        .bold()
                        .padding()
                    Spacer()
                    Button(action: {
                        print("Adicionar avaliação pressionado.")
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                            .frame(width: 26, height: 26, alignment: .center)
                    }
                    .padding()
                }
                    
                if viewModel.existemAvaliacoes {
                    VStack() {
                        ForEach(viewModel.avaliacoes!) { avaliacao in
                            AvaliacaoLinha(viewModel: AvaliacaoLinhaViewModel(avaliacao: avaliacao))
                                .frame(height: 88)
                                .background(Color.white)
                                .cornerRadius(14)
                                .shadow(color: .gray, radius: 2, x: 0.0, y: 1)
                                .padding(.horizontal, 15)
                                .padding(.bottom, 5)
                        }
                    }
                    .padding(.bottom, 35)
                } else {
                    Text("Não existem avaliações para essa cerveja.")
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                        .padding(.bottom, 35)
                        .padding(.horizontal, 10)
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
        ForEach(["iPhone 11"], id: \.self) { deviceName in
            CervejaDetalhe(viewModel: CervejaDetalheViewModel(cerveja: avaliacaoDados[0]))
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
