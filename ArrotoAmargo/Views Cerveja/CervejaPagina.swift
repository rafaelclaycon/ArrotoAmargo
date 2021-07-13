//
//  CervejaPagina.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 23/08/20.
//

import SwiftUI

struct CervejaPagina: View {
    @ObservedObject var viewModel: CervejaPaginaViewModel
    
    var body: some View {
        VStack {
            CervejariaCelula(viewModel: CervejariaCelulaViewModel(cervejaria: viewModel.cervejaria, marca: viewModel.marca))
            
            HStack {
                MedidorIBU(valor: viewModel.ibu)
                    .padding(.all, 20)
                
                MostradorTeorAlcoolico(valor: viewModel.teorAlcoolico, texto: viewModel.getTeorAlcoolicoTexto())
                    .frame(width: 200, height: 80, alignment: .center)
            }
            .padding()
        }
    }
}

/*struct CervejaPageView_Previews: PreviewProvider {
    static var previews: some View {
        CervejaPagina(viewModel: CervejaPaginaViewModel(cervejaria: cervejaDados[1].cervejaria!, marca: cervejaDados[1].marca!, ibu: Int(round(cervejaDados[1].ibu)), teorAlcoolico: cervejaDados[1].teorAlcoolico))
    }
}*/
