//
//  AvaliacaoLista.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 12/07/20.
//

import SwiftUI

struct AvaliacaoLista: View {
    @State var preferencias: PreferenciasUsuario
    
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $preferencias.tipoListaSelecionado, label: Text("Tipo")) {
                    ForEach(PreferenciasUsuario.TipoLista.allCases, id: \.self) { tipo in
                        Text(tipo.rawValue).tag(tipo)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.all, 22)
                
                List(avaliacaoDados) { avaliacao in
                    NavigationLink(destination: AvaliacaoCervejaDetalhe(avaliacao: avaliacao)) {
                        AvaliacaoCervejaLinha(avaliacaoCerveja: avaliacao)
                    }
                }
            }
            .navigationBarTitle(Text("Cervejas 🍻"))
        }
    }
}

struct AvaliacaoLista_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (1st generation)", "iPhone SE (2nd generation)", "iPhone 11 Pro Max", "iPad Pro (11-inch) (2nd generation)"], id: \.self) { deviceName in
            AvaliacaoLista(preferencias: PreferenciasUsuario(tipoListaSelecionado: PreferenciasUsuario.TipoLista.cervejas))
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
