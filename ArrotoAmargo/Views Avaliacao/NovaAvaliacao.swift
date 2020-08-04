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
    @State private var indiceCerveja = 0
    @State private var dataRegistro = Date()
    @State private var usarLocalizacaoAtual: Bool = true

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Para")) {
                    Picker(selection: $indiceCerveja, label: Text("Nome")) {
                        ForEach(0 ..< viewModel.cervejas.count) {
                            Text("\(self.viewModel.cervejas[$0])")
                        }
                    }
                }
                
                Section(header: Text("Degustada em")) {
                    DatePicker(selection: $dataRegistro, in: ...Date(), displayedComponents: [.date, .hourAndMinute]) {
                    }
                }
                
                Section(header: Text("Local de consumo")) {
                    TextField("Descrição do local", text: $nome)
                    Toggle(isOn: $usarLocalizacaoAtual) {
                        Text("Usar localização atual")
                    }
                }
                
                Section {
                    Stepper(value: $viewModel.nota, in: 0...5) {
                        Text("Nota: \(viewModel.nota)")
                    }
                    Text(viewModel.textoNota)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title)
                }
                
                Section(header: Text("Anotações")) {
                    TextEditor(text: $fullText)
                        .frame(height: 100)
                    Button("Adicionar foto") {
                        print("Hora de tirar foto!")
                    }
                }
                
                Button("Salvar avaliação") {
                    self.estaSendoExibido = false
                }
            }
            .navigationBarTitle("Nova Avaliação 📕")
            .onDisappear {
                self.estaSendoExibido = false
            }
        }
    }
}

struct NovaAvaliacao_Previews: PreviewProvider {
    static var previews: some View {
        NovaAvaliacao(viewModel: NovaAvaliacaoViewModel(), estaSendoExibido: .constant(true))
    }
}
