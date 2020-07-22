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
        let navBarItemSize: CGFloat = 36
        
        TabView {
            NavigationView {
                List(avaliacaoDados) { avaliacao in
                    NavigationLink(destination: AvaliacaoCervejaDetalhe(avaliacao: avaliacao)) {
                        AvaliacaoCervejaLinha(avaliacaoCerveja: avaliacao)
                    }
                }
                .navigationBarItems(trailing:
                    HStack {
                        Button(action: {
                            print("Ordernar cervejas pressionado!")
                        }) {
                            Image(systemName: "arrow.up.arrow.down")
                                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        .frame(width: navBarItemSize, height: navBarItemSize, alignment: .center)
                        
                        Button(action: {
                            print("Adicionar cerveja pressionado!")
                        }) {
                            Image(systemName: "plus")
                                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        .frame(width: navBarItemSize, height: navBarItemSize, alignment: .center)
                    }
                )
                .navigationBarTitle(Text("Cervejas 🍻"))
            }
            .tabItem {
                Image(systemName: "circle.grid.2x2.fill")
                Text("Cervejas")
            }
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
            .tabItem {
                Image(systemName: "calendar")
                Text("Diário")
            }
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
            .tabItem {
                Image(systemName: "mappin.and.ellipse")
                Text("Mapa")
            }
        }
    }
}

struct AvaliacaoLista_Previews: PreviewProvider {
    static var previews: some View {
        // iPhone SE (1st generation)
        // iPhone SE (2nd generation)
        // iPad Pro (11-inch) (2nd generation)
        ForEach(["iPhone 11 Pro Max"], id: \.self) { deviceName in
            AvaliacaoLista(preferencias: PreferenciasUsuario(tipoListaSelecionado: PreferenciasUsuario.TipoLista.cervejas))
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
