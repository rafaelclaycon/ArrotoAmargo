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
    @State private var metodoDefinicaoCor = 0
    @State private var indiceCor = 0
    @State private var corTexto: String = ""
    @State private var cor = Color.white
    @State var selection: Int? = nil
    
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
                
                Section(header: Text("Cor")/*, footer: Text("Escolher uma das cores pré-definidas pode ser o método menos fiél de definir a cor da cerveja.")*/) {
                    Picker(selection: $metodoDefinicaoCor, label: Text("Cor")) {
                        Text("Selecionar").tag(0)
                        Text("Digitar").tag(1)
                        Text("Medir").tag(2)
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    if metodoDefinicaoCor == 0 {
                        NavigationLink(destination: CorLista(), tag: 1, selection: $selection) {
                            Button(action: {
                                self.selection = 1
                            }) {
                                HStack {
                                    Color(red: 0.97, green: 0.96, blue: 0.38)
                                        .frame(width: 100, height: 36)
    //                                    .overlay(
    //                                        RoundedRectangle(cornerRadius: 7)
    //                                            .stroke(Color.gray, lineWidth: 1)
    //                                    )
                                        .cornerRadius(7)
                                        .padding(.all, 4)
                                    Text("Pale Lager, Witbier, Pilsener")
                                        .foregroundColor(.gray)
                                        .padding(.leading, 6)
                                    //Spacer()
//                                    Image(systemName: "chevron.right")
//                                        .foregroundColor(.gray)
                                        //.padding(.trailing, 26)
                                }
                                //.frame(maxWidth: .infinity)
                            }
                        }
                    } else if metodoDefinicaoCor == 1 {
                        TextField("SRM", text: $corTexto)
                            .keyboardType(.numberPad)
                    } else if metodoDefinicaoCor == 2 {
                        //ColorPicker("Cor", selection: $cor)
                        Button(action: {
                            print("Tocou em escolher.")
                        }) {
                            Text("Escolher")
                        }
                    }
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
