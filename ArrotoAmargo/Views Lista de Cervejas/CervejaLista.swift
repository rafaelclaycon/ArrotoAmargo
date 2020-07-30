//
//  CervejaLista.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 12/07/20.
//

import SwiftUI

struct CervejaLista: View {
    @State var preferencias: PreferenciasUsuario
    @State private var showingSheet = false
    @ObservedObject var viewModel = CervejaListaViewModel(cervejas: avaliacaoDados)
    
    var body: some View {
        let navBarItemSize: CGFloat = 36
        
        TabView {
            NavigationView {
                List(viewModel.cervejas) { cerveja in
                    NavigationLink(destination: CervejaDetalhe(viewModel: CervejaDetalheViewModel(cerveja: cerveja))) {
                        CervejaLinha(cerveja: cerveja)
                    }
                }
                .navigationBarItems(trailing:
                    HStack {
                        Button(action: {
                            print("Ordernar cervejas pressionado!")
                            self.showingSheet = true
                        }) {
                            Image(systemName: "arrow.up.arrow.down")
                                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        .frame(width: navBarItemSize, height: navBarItemSize, alignment: .center)
                        .actionSheet(isPresented: $showingSheet) {
                            ActionSheet(title: Text("Ordenar cervejas"),
                                        message: Text("Escolha uma propriedade da cerveja para reordernar a lista."),
                                        buttons: [.default(Text("🔠  Nome (A → Z)")) { self.viewModel.ordenarAlfabeticamentePeloNomeDaCerveja() },
                                                  .default(Text("🥇  Nota (5 → 0)")) { self.viewModel.ordenarPorNota() },
                                                  .default(Text("📆  Data de adição")),
                                                  .default(Text("😖  IBU")) { self.viewModel.ordenarPorIBU() },
                                                  .cancel(Text("Cancelar"))])
                        }
                        
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
                    
                    List(avaliacaoDados) { cerveja in
                        NavigationLink(destination: CervejaDetalhe(viewModel: CervejaDetalheViewModel(cerveja: cerveja))) {
                            CervejaLinha(cerveja: cerveja)
                        }
                    }
                }
                .navigationBarTitle(Text("Diário 📓"))
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
                    
                    List(avaliacaoDados) { cerveja in
                        NavigationLink(destination: CervejaDetalhe(viewModel: CervejaDetalheViewModel(cerveja: cerveja))) {
                            CervejaLinha(cerveja: cerveja)
                        }
                    }
                }
                .navigationBarTitle(Text("Mapa 🗺"))
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
            CervejaLista(preferencias: PreferenciasUsuario(tipoListaSelecionado: PreferenciasUsuario.TipoLista.cervejas))
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
