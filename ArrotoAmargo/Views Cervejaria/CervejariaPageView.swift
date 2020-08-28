//
//  CervejariaPageView.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 23/08/20.
//

import SwiftUI

struct CervejariaPageView: View {
    var body: some View {
        CervejariaCelula(viewModel: CervejariaCelulaViewModel(cervejaria: viewModel.cervejaria, marca: viewModel.marca))
    }
}

struct CervejariaPageView_Previews: PreviewProvider {
    static var previews: some View {
        CervejariaPageView()
    }
}
