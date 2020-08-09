//
//  NovaCervejaria.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 03/08/20.
//

import SwiftUI
import CoreLocation

struct NovaCervejaria: View {
    @ObservedObject var viewModel: NovaCervejariaViewModel
    @Binding var estaSendoExibido: Bool
    @State private var nome: String = ""
    @State private var nacional: Bool = true
    @State private var cidade: String = ""
    @State private var estado: String = ""
    @State private var pais: String = "🇧🇷 Brasil"
    @State private var indiceEstado = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Nome", text: $nome)
                }
                
                Section(header: Text("Localização")) {
                    Toggle(isOn: $nacional) {
                        Text("Nacional")
                    }
//                    Mapa(coordinate: CLLocationCoordinate2D(latitude: -29.67756663, longitude: -51.06552601))
//                        //.edgesIgnoringSafeArea(.all)
//                        .frame(height: 180)
                    TextField("Cidade", text: $cidade)
                    if self.nacional {
                        Picker(selection: $indiceEstado, label: Text("Estado")) {
                            ForEach(0 ..< viewModel.estados.count) {
                                Text("\(self.viewModel.estados[$0])")
                            }
                        }
                    } else {
                        TextField("Estado", text: $estado)
                    }
                    TextField("País", text: $pais)
                        .disabled(nacional)
                }
            }
            .navigationBarTitle("Nova Cervejaria 🏢")
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

struct NovaCervejaria_Previews: PreviewProvider {
    static var previews: some View {
        NovaCervejaria(viewModel: NovaCervejariaViewModel(), estaSendoExibido: .constant(true))
    }
}
