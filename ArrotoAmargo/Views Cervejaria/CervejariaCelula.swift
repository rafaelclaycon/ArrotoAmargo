//
//  CervejariaCelula.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 25/07/20.
//

import SwiftUI
import CoreLocation

struct CervejariaCelula: View {
    @ObservedObject var viewModel: CervejariaCelulaViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("PRODUZIDA E ENVASADA POR:")
                .font(.subheadline)
                .bold()
                .foregroundColor(.gray)
                .padding(.leading, 20)
            
            // Cervejaria
            HStack {
                Mapa(coordinate: viewModel.localizacao)
                    .frame(width: 80, height: 70)
                    
                VStack(alignment: .leading) {
                    Text(viewModel.nomeCervejaria)
                        .font(.body)
                        .bold()
                        .padding(.leading, 10)
                        .padding(.bottom, 6)
                    
                    Text(viewModel.endereco)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.leading, 10)
                        //.padding(.top, 2)
                }
                
                Spacer()
                
                Button(action: {
                    print("Ver detalhes da cervejaria pressionado")
                    //self.showingSheet = true
                }) {
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(.gray)
                .padding(.trailing, 26)
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("SOB A MARCA:")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.gray)
                        .padding(.leading, 20)
                    
                    HStack {
                        viewModel.logoCervejaria
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50, alignment: .center)
                            .padding(.leading, 15)
                        Text(viewModel.nomeMarca)
                            .bold()
                            .padding(.leading, 20)
                            .padding(.top, 6)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("PARA:")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.gray)
                        .padding(.leading, 20)
                        .padding(.bottom, 6)
                    Text(viewModel.nomeProprietarioMarca)
                        .bold()
                        .padding(.leading, 20)
                }
                Spacer()
            }
        }
    }
}

struct CervejariaCelula_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CervejariaCelula(viewModel: CervejariaCelulaViewModel(cervejaria: cervejariaDados[0], marca: marcaDados[0]))
            CervejariaCelula(viewModel: CervejariaCelulaViewModel(cervejaria: cervejariaDados[0], marca: marcaDados[1]))
        }
            .previewLayout(.fixed(width: 414, height: 200))
    }
}
