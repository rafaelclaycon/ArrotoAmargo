//
//  TVCervejaLista.swift
//  TVArrotoAmargo
//
//  Created by Rafael Schmitt on 13/08/20.
//

import SwiftUI

struct TVCervejaLista: View {
    @ObservedObject var viewModel = CervejaListaViewModel(cervejas: cervejaDados)
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Saúde! 🍻")
                    .font(.title)
                    .bold()
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.cervejas) { cerveja in
                            NavigationLink(destination: CervejaDetalhe(viewModel: CervejaDetalheViewModel(cerveja: cerveja))) {
                                TVCervejaLinha(viewModel: CervejaLinhaViewModel(cerveja: cerveja))
                                    .frame(width: 400, height: 400, alignment: .center)
                                    .cornerRadius(25)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct TVCervejaLista_Previews: PreviewProvider {
    static var previews: some View {
        TVCervejaLista()
    }
}
