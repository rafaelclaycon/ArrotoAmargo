import SwiftUI
import CoreLocation

struct CervejaLista: View {

    @ObservedObject var viewModel = CervejaListaViewModel(cervejas: cervejaDados)
    
    var body: some View {
        let navBarItemSize: CGFloat = 36
        
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
                        ActionSheet(title: Text("Criar nova:"),
                                    message: nil,
                                    buttons: [.default(Text("📕  Avaliação")) { viewModel.exibirCadastroNovaAvaliacao() },
                                              .default(Text("🍺  Cerveja")) { viewModel.exibirCadastroNovaCerveja() },
                                              .default(Text("🏢  Cervejaria")) { viewModel.exibirCadastroNovaCevejaria() },
                                              .default(Text("💎  Marca")),
                                              .cancel(Text("Cancelar"))])
                    }
                }
            )
            .navigationBarTitle(Text("Cervejas 🍻"))
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
    }

}

/*struct AvaliacaoLista_Previews: PreviewProvider {
    static var previews: some View {
        // iPhone SE (1st generation)
        // iPhone SE (2nd generation)
        // iPad Pro (11-inch) (2nd generation)
        ForEach(["iPhone 11 Pro Max"], id: \.self) { deviceName in
            CervejaLista(preferencias: PreferenciasUsuario(tipoListaSelecionado: PreferenciasUsuario.TipoLista.cervejas))
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}*/
