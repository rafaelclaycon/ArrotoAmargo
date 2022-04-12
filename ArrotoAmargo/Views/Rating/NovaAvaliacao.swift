import SwiftUI

struct NovaAvaliacao: View {

    @ObservedObject var viewModel: NovaAvaliacaoViewModel
    @Binding var estaSendoExibido: Bool

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("DE")) {
                    Picker(selection: $viewModel.indiceCerveja, label: Text("Cerveja")) {
                        ForEach(0 ..< viewModel.cervejas.count, id:\.self) {
                            Text("\(self.viewModel.cervejas[$0])")
                        }
                    }.disabled(viewModel.veioTelaDetalheCerveja)
                }
                
                Section(header: Text("Degustada em")) {
                    DatePicker(selection: $viewModel.dataRegistro, in: ...Date(), displayedComponents: [.date, .hourAndMinute]) {
                    }
                }
                
                Section(header: Text("Local de consumo")) {
                    TextField("Minha casa, Casa do Pedro, Bar do Zé...", text: $viewModel.descricaoLocal)
//                    Toggle(isOn: $viewModel.usarLocalizacaoAtual) {
//                        Text("Usar localização atual")
//                    }
                }
                
                Section {
                    Stepper(value: $viewModel.nota, in: 0...10) {
                        Text("Nota: \(viewModel.nota)")
                    }
//                    Text(viewModel.textoNota)
//                        .frame(maxWidth: .infinity, alignment: .center)
//                        .font(.title)
                    MostradorNotaEmoji(viewModel: MostradorNotaEmojiViewModel(nota: viewModel.nota))
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Section(header: Text("Anotações")) {
                    TextEditor(text: $viewModel.anotacoes)
                        .frame(height: 100)
                    Button("Adicionar foto") {
                        print("Hora de tirar foto!")
                    }
                }
                
                Button("Salvar avaliação") {
                    //print("Cerveja: \(cervejaDados[0].nome)")
                    viewModel.salvarAvaliacao()
                    self.estaSendoExibido = false
                }
            }
            .navigationBarTitle("Nova Avaliação 📕")
            .navigationBarItems(leading:
                Button(action: {
                    self.estaSendoExibido = false
                }) {
                    Text("Cancelar")
                }
            )
        }
    }

}

struct NovaAvaliacao_Previews: PreviewProvider {

    static var previews: some View {
        NovaAvaliacao(viewModel: NovaAvaliacaoViewModel(nomeCerveja: nil, idCerveja: nil), estaSendoExibido: .constant(true))
    }

}
