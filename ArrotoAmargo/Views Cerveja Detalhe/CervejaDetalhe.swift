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
                }
                
                HStack {
                    viewModel.imagem
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                    VStack(alignment: .leading) {
                        Text(viewModel.nome)
                            .font(.title2)
                            .bold()
                            .accessibility(identifier: UIID.nomeCervejaTitulo)
                            .padding(.bottom, 8)
                            .padding(.leading, 10)
                        viewModel.getTextoEstilo()
                            .font(.subheadline)
                            .bold()
                            .padding(.leading, 10)
                    }
                    Spacer()
                    MedidorNota(nota: viewModel.nota)
                        .padding(.all, 20)
                }
                .padding(.bottom, 15)
                
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
                        .padding(.leading, 20)
                    Spacer()
                    Button(action: {
                        self.exibindoTelaNovaAvaliacao.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                            .frame(width: 26, height: 26, alignment: .center)
                    }
                    .padding(.trailing, 20)
                    .sheet(isPresented: $exibindoTelaNovaAvaliacao) {
                        NovaAvaliacao(viewModel: NovaAvaliacaoViewModel(), estaSendoExibido: $exibindoTelaNovaAvaliacao)
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
            CervejaDetalhe(viewModel: CervejaDetalheViewModel(cerveja: cervejaDados[1]))
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
