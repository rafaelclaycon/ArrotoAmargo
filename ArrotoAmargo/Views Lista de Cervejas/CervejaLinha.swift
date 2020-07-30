//
//  CervejaLinha.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 11/07/20.
//

import SwiftUI

struct CervejaLinha: View {
    var cerveja: Cerveja
    
    var body: some View {
        HStack {
            cerveja.imagem
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
            
            let nomeCervejaria = cerveja.cervejaria!.nomeGrupo != nil ? cerveja.cervejaria!.nomeGrupo! : cerveja.cervejaria!.nome
            
            VStack(alignment: .leading) {
                Text(cerveja.nome)
                    .font(.headline)
                Text(nomeCervejaria)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
}

struct CervejaLinha_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CervejaLinha(cerveja: avaliacaoDados[0])
            CervejaLinha(cerveja: avaliacaoDados[1])
        }
        .previewLayout(.fixed(width: 350, height: 70))
    }
}
