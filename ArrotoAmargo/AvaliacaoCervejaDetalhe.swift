//
//  BeerDetail.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 09/07/20.
//

import SwiftUI

struct AvaliacaoCervejaDetalhe: View {
    var body: some View {
        Image("IPA")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct BeerDetail_Previews: PreviewProvider {
    static var previews: some View {
        AvaliacaoCervejaDetalhe()
    }
}
