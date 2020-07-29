//
//  NovaAvaliacao.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 29/07/20.
//

import SwiftUI

struct NovaAvaliacao: View {
    @State private var nome: String = ""
    @State private var fullText: String = "This is some editable text..."

    var body: some View {
        VStack(alignment: .leading) {
            Text("Nova Cerveja 🍺")
                .font(.title)
                .bold()
            
            TextField("Nome", text: $nome)
                //.padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextEditor(text: $fullText)
                .foregroundColor(Color.gray)
                .font(.custom("HelveticaNeue", size: 13))
                .lineSpacing(5)
        }
        .padding()
    }
}

struct NovaAvaliacao_Previews: PreviewProvider {
    static var previews: some View {
        NovaAvaliacao()
    }
}
