//
//  CervejariaPagina.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 23/08/20.
//

import SwiftUI

struct CervejariaPagina: View {
    @ObservedObject var viewModel: CervejariaPaginaViewModel
    
    var body: some View {
        CervejariaCelula(viewModel: CervejariaCelulaViewModel(cervejaria: viewModel.cervejaria, marca: viewModel.marca))
    }
}

//struct CervejariaPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        CervejariaPagina(viewModel: CervejariaPaginaViewModel(cervejaria: cervejaDados[1].cervejaria!, marca: cervejaDados[1].marca!))
//    }
//}
