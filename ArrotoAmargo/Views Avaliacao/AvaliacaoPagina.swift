//
//  AvaliacaoPagina.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 23/08/20.
//

import SwiftUI

struct AvaliacaoPagina: View {
    @ObservedObject var viewModel = AvaliacaoPaginaViewModel(cervejas: cervejaDados)
    
    var body: some View {
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
            .sheet(isPresented: $exibindoTelaNovaAvaliacao, onDismiss: { viewModel.atualizarListaAvaliacoes() }) {
                NovaAvaliacao(viewModel: NovaAvaliacaoViewModel(nomeCerveja: viewModel.nome, idCerveja: viewModel.idCerveja), estaSendoExibido: $exibindoTelaNovaAvaliacao)
            }
        }
        .padding(.bottom, 20)
            
        if viewModel.existemAvaliacoes {
            VStack() {
                ForEach(viewModel.avaliacoes!) { avaliacao in
                    AvaliacaoLinha(viewModel: AvaliacaoLinhaViewModel(avaliacao: avaliacao))
                        .frame(height: 150)
                        .background(Color.background)
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
}

struct AvaliacaoPageView_Previews: PreviewProvider {
    static var previews: some View {
        AvaliacaoPageView()
    }
}
