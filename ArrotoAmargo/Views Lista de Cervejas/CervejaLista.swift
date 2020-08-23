//
//  CervejaLista.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 12/07/20.
//

import SwiftUI
import CoreLocation

struct CervejaLista: View {
    @ObservedObject var viewModel = CervejaListaViewModel(cervejas: cervejaDados)
    @State var preferencias: PreferenciasUsuario
    
    var body: some View {
        let navBarItemSize: CGFloat = 36
        
        TabView {
            NavigationView {
                List(viewModel.cervejas) { cerveja in
                    NavigationLink(destination: CervejaDetalhe(viewModel: CervejaDetalheViewModel(cerveja: cerveja))) {
                        CervejaLinha(viewModel: CervejaLinhaViewModel(cerveja: cerveja))
                    }
                }
                .navigationBarItems(trailing:
                    HStack {
                        Button(action: {
                            print("Ordernar cervejas pressionado!")
                            viewModel.exibindoOpcoesOrdenacao = true
                        }) {
                            Image(systemName: "arrow.up.arrow.down")
                                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        .frame(width: navBarItemSize, height: navBarItemSize, alignment: .center)
                        .actionSheet(isPresented: $viewModel.exibindoOpcoesOrdenacao) {
                            viewModel.getActionSheetOrdenacao()
                        }

                        Button(action: {
                            print("Adicionar cerveja pressionado!")
                            viewModel.exibindoOpcoesCriacao = true
                        }) {
                            Image(systemName: "plus")
                                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        .frame(width: navBarItemSize, height: navBarItemSize, alignment: .center)
                        .actionSheet(isPresented: $viewModel.exibindoOpcoesCriacao) {
                            ActionSheet(title: Text("O que você deseja criar?"),
                                        message: nil,
                                        buttons: [.default(Text("📕  Nova avaliação")) { viewModel.exibirCadastroNovaAvaliacao() },
                                                  .default(Text("🍺  Nova cerveja")) { viewModel.exibirCadastroNovaCerveja() },
                                                  .default(Text("🏢  Nova cervejaria")) { viewModel.exibirCadastroNovaCevejaria() },
                                                  .default(Text("💎  Nova marca")),
                                                  .cancel(Text("Cancelar"))])
                        }
                    }
                )
                .navigationBarTitle(Text("Cervejas 🍻"))
                .accessibility(identifier: UIID.cervejaLista)
            }
            .sheet(isPresented: $viewModel.exibindoModal) {
                if viewModel.exibirCadastroAvaliacao {
                    NovaAvaliacao(viewModel: NovaAvaliacaoViewModel(nomeCerveja: nil, idCerveja: nil), estaSendoExibido: $viewModel.exibindoModal)
                } else if viewModel.exibirCadastroCerveja {
                    NovaCerveja(viewModel: NovaCervejaViewModel(), estaSendoExibido: $viewModel.exibindoModal)
                } else if viewModel.exibirCadastroCervejaria {
                    NovaCervejaria(viewModel: NovaCervejariaViewModel(), estaSendoExibido: $viewModel.exibindoModal)
                }
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

                    List(cervejaDados) { cerveja in
                        NavigationLink(destination: CervejaDetalhe(viewModel: CervejaDetalheViewModel(cerveja: cerveja))) {
                            CervejaLinha(viewModel: CervejaLinhaViewModel(cerveja: cerveja))
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

                    Mapa(coordinate: CLLocationCoordinate2D(latitude: -29.67756663, longitude: -51.06552601))
                        .edgesIgnoringSafeArea(.all)
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
