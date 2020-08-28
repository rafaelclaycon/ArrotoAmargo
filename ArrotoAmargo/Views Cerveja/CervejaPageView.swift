//
//  CervejaPageView.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 23/08/20.
//

import SwiftUI

struct CervejaPageView: View {
    var body: some View {
        HStack() {
            MedidorIBU(valor: viewModel.ibu)
                .padding(.all, 20)
            
            MostradorTeorAlcoolico(valor: viewModel.teorAlcoolico, texto: viewModel.getTeorAlcoolicoTexto())
                .frame(width: 200, height: 80, alignment: .center)
        }
        .padding()
    }
}

struct CervejaPageView_Previews: PreviewProvider {
    static var previews: some View {
        CervejaPageView()
    }
}
