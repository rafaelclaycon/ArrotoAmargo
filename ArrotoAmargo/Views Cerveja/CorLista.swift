//
//  CorLista.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 12/08/20.
//

import SwiftUI

struct CorLista: View {
    var body: some View {
        List(cores) { cor in
            Color(red: cor.valorVermelho, green: cor.valorVerde, blue: cor.valorAzul)
                .frame(width: 100, height: 36)
                .cornerRadius(7)
                .padding(.all, 4)
            Text(cor.exemplos)
            Spacer()
            Image(systemName: "checkmark")
                .font(Font.body.weight(.medium))
                .foregroundColor(.orange)
        }
    }
}

struct CorLista_Previews: PreviewProvider {
    static var previews: some View {
        CorLista()
    }
}
