//
//  NovaAvaliacao.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 29/07/20.
//

import SwiftUI

struct NovaAvaliacao: View {
    @ObservedObject var viewModel: NovaAvaliacaoViewModel
    @Binding var estaSendoExibido: Bool
    @State private var nome: String = ""
    @State private var fullText: String = ""
    @State private var dataRegistro = Date()
    @State private var usarLocalizacaoAtual: Bool = true

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Para")) {
                    Picker(selection: $viewModel.indiceCerveja, label: Text("Nome")) {
                        ForEach(0 ..< viewModel.cervejas.count) {
                            Text("\(self.viewModel.cervejas[$0])")
                        }
                    }
                }
                
                #if !os(tvOS)
                Section(header: Text("Degustada em")) {
                    DatePicker(selection: $dataRegistro, in: ...Date(), displayedComponents: [.date, .hourAndMinute]) {
                    }
                }
                #endif
                
                Section(header: Text("Local de consumo")) {
                    TextField("Descrição do local", text: $nome)
                    Toggle(isOn: $usarLocalizacaoAtual) {
                        Text("Usar localização atual")
                    }
                }
                
                Section {
                    #if !os(tvOS)
                    Stepper(value: $viewModel.nota, in: 0...5) {
                        Text("Nota: \(viewModel.nota)")
                    }
                    #endif
//                    Text(viewModel.textoNota)
//                        .frame(maxWidth: .infinity, alignment: .center)
//                        .font(.title)
                    MostradorNotaEmoji(viewModel: MostradorNotaEmojiViewModel(nota: viewModel.nota))
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Section(header: Text("Anotações")) {
                    #if !os(tvOS)
                    TextEditor(text: $fullText)
                        .frame(height: 100)
                    #endif
                    Button("Adicionar foto") {
                        print("Hora de tirar foto!")
                    }
                }
                
                Button("Salvar avaliação") {
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
        NovaAvaliacao(viewModel: NovaAvaliacaoViewModel(nomeCerveja: nil), estaSendoExibido: .constant(true))
    }
}
