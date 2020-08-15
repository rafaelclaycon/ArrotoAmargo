//
//  TVCervejaLinha.swift
//  TVArrotoAmargo
//
//  Created by Rafael Schmitt on 13/08/20.
//

import SwiftUI

struct TVCervejaLinha: View {
    @ObservedObject var viewModel: CervejaLinhaViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if viewModel.existeFoto {
                viewModel.primeiraFoto()
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 180)
                    .clipped()
            }
            
            Text(viewModel.nomeCerveja)
                .font(.headline)
                .padding(.bottom, 0.1)
                .padding(.leading, 5)
            
            HStack {
                Text(viewModel.nomeCervejaria)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.leading, 5)
            }
        }
    }
}

struct TVCervejaLinha_Previews: PreviewProvider {
    static var previews: some View {
        TVCervejaLinha(viewModel: CervejaLinhaViewModel(cerveja: cervejaDados[0]))
            .previewDevice("Apple TV 4K (at 1080p)")
    }
}
