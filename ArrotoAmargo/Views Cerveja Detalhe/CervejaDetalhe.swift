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
                
                ScrollView {
                    LazyHStack {
                        TabView {
                            CervejaPageView()
                            
                            CervejariaPageView()
                            
                            AvaliacaoPageView()
                        }
                        .frame(width: UIScreen.main.bounds.width, height: 200)
                        .tabViewStyle(PageTabViewStyle())
                    }
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
