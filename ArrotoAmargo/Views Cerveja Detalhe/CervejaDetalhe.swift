//
//  CervejaDetalhe.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 09/07/20.
//

import SwiftUI

struct CervejaDetalhe: View {
    @ObservedObject var viewModel: CervejaDetalheViewModel
    //@State var exibindoTelaNovaAvaliacao = false
    @State private var indicePagina = 0
    
    var body: some View {
        VStack {
//            if viewModel.existemFotosUsuario {
//                viewModel.primeiraFoto()
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .edgesIgnoringSafeArea(.top)
//                    .frame(height: 180)
//                    .clipped()
//            }
            
            HStack {
//                viewModel.imagem
//                    .resizable()
//                    .frame(width: 100, height: 100, alignment: .center)
                VStack(alignment: .leading) {
                    Text(viewModel.nome)
                        .font(.title2)
                        .bold()
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
            
            Picker(selection: $indicePagina, label: Text("Info")) {
                Text("Detalhes").tag(0)
                Text("Avaliações").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 25)
            .padding(.bottom, 20)

            if indicePagina == 0 {
                CervejaPagina(viewModel: CervejaPaginaViewModel(cervejaria: viewModel.cervejaria, marca: viewModel.marca, ibu: viewModel.ibu, teorAlcoolico: viewModel.teorAlcoolico))
                Spacer()
            } else if indicePagina == 1 {
//                AvaliacaoPagina(viewModel: AvaliacaoPaginaViewModel(avaliacoes: viewModel.avaliacoes, idCerveja: viewModel.idCerveja, nomeCerveja: viewModel.nome))
            }
        }
        .navigationBarTitle(Text(viewModel.nome), displayMode: .inline)
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
