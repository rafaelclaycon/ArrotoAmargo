//
//  NovaCerveja.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 03/08/20.
//

import SwiftUI

struct NovaCerveja: View {
    @ObservedObject var viewModel: NovaCervejaViewModel
    @Binding var estaSendoExibido: Bool
    @State private var nome: String = ""
    @State private var indiceEstilo = 0
    @State private var indiceMarca = 0
    @State private var indiceCervejaria = 0
    @State private var ibu: Double = 0
    @State private var notasDegustacao: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
//                    ImageStore.shared.image(name: "bellavista_american_ipa")
//                        .resizable()
//                        .frame(width: 100, height: 100, alignment: .center)
                    
                    TextField("Nome", text: $nome)
                    Button("Tirar foto") {
                        print("Câmera aberta")
                    }
                }
                
                Section {
                    Picker(selection: $indiceEstilo, label: Text("Estilo")) {
                        ForEach(0 ..< viewModel.estilos.count) {
                            Text("\(self.viewModel.estilos[$0])")
                        }
                    }
                    
                    Picker(selection: $indiceMarca, label: Text("Marca")) {
                        ForEach(0 ..< viewModel.marcas.count) {
                            Text("\(self.viewModel.marcas[$0])")
                        }
                    }
                    
                    Picker(selection: $indiceCervejaria, label: Text("Cervejaria")) {
                        ForEach(0 ..< viewModel.cervejarias.count) {
                            Text("\(self.viewModel.cervejarias[$0])")
                        }
                    }
                }
                
                Section(header: Text("Amargor")) {
                    Slider(value: $ibu, in: 0...120, step: 1)
                    Text("IBU: \(Int(ibu))")
                }
                
                Section(header: Text("Teor alcoólico")) {
                    Slider(value: $viewModel.teorAlcoolico, in: 0...10, step: 0.1)
                    Text(viewModel.textoTeorAlcoolico)
                }
                
                Section {
                    Text("Cor")
                }
                
                Section(header: Text("Notas de degustação")) {
                    TextEditor(text: $notasDegustacao)
                        .frame(height: 100)
                }
                
                Button("Salvar cerveja") {
                    self.estaSendoExibido = false
                }
            }
            .navigationBarTitle("Nova Cerveja 🍺")
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

struct NovaCerveja_Previews: PreviewProvider {
    static var previews: some View {
        NovaCerveja(viewModel: NovaCervejaViewModel(), estaSendoExibido: .constant(true))
    }
}
