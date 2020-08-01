//
//  CervejaDetalhe.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 09/07/20.
//

import SwiftUI

struct CervejaDetalhe: View {
    @ObservedObject var viewModel: CervejaDetalheViewModel
    @State var exibindoTelaNovaAvaliacao = false
    
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
//                } else {
//                    Mapa(coordinate: viewModel.locationCoordinate)
//                        .edgesIgnoringSafeArea(.top)
//                        .frame(height: 180)
                }
                
                HStack {
                    viewModel.imagem.resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                    Text(viewModel.nome)
                        .font(.title)
                        .bold()
                        .accessibility(identifier: UIID.nomeCervejaTitulo)
                    Spacer()
                    MedidorNota(nota: viewModel.nota)
                        .padding(.all, 20)
                }
                
                CervejariaCelula(viewModel: CervejariaCelulaViewModel(cervejaria: viewModel.cervejaria, marca: viewModel.marca))
                Spacer()
                
                HStack() {
                    MedidorIBU(valor: viewModel.ibu)
                        .padding(.all, 20)
                    
                    MostradorTeorAlcoolico(valor: viewModel.teorAlcoolico, texto: viewModel.getTeorAlcoolicoTexto())
                        .frame(width: 200, height: 80, alignment: .center)
                }
                .padding()
                
                HStack() {
                    Text("Avaliações")
                        .font(.title2)
                        .bold()
                        .padding()
                    Spacer()
                    Button(action: {
                        self.exibindoTelaNovaAvaliacao.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                            .frame(width: 26, height: 26, alignment: .center)
                    }
                    .padding()
                    .sheet(isPresented: $exibindoTelaNovaAvaliacao) {
                        NovaAvaliacao()
                    }
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
            CervejaDetalhe(viewModel: CervejaDetalheViewModel(cerveja: cervejaDados[0]))
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
