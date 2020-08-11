//
//  MostradorNotaEmoji.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 10/08/20.
//

import SwiftUI

struct MostradorNotaEmoji: View {
    @ObservedObject var viewModel: MostradorNotaEmojiViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("😖")
                    .font(.title)
                    .offset(x: -8)
                    .opacity(viewModel.opacidadePrimeiro)
                Text("😬")
                    .font(.title)
                    .offset(x: -5)
                    .opacity(viewModel.opacidadeSegundo)
                Text("🧐")
                    .font(.title)
                    .opacity(viewModel.opacidadeTerceiro)
                Text("😌")
                    .font(.title)
                    .offset(x: 5)
                    .opacity(viewModel.opacidadeQuarto)
                Text("😍")
                    .font(.title)
                    .offset(x: 8)
                    .opacity(viewModel.opacidadeQuinto)
            }
            .padding(.bottom, 3)
            Text("EITA...")
                .font(.footnote)
                .foregroundColor(.gray)
                .bold()
        }
    }
}

struct MostradorNotaEmoji_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MostradorNotaEmoji(viewModel: MostradorNotaEmojiViewModel(nota: 0))
            MostradorNotaEmoji(viewModel: MostradorNotaEmojiViewModel(nota: 1))
            MostradorNotaEmoji(viewModel: MostradorNotaEmojiViewModel(nota: 2))
            MostradorNotaEmoji(viewModel: MostradorNotaEmojiViewModel(nota: 3))
            MostradorNotaEmoji(viewModel: MostradorNotaEmojiViewModel(nota: 4))
            MostradorNotaEmoji(viewModel: MostradorNotaEmojiViewModel(nota: 5))
        }
        .previewLayout(.fixed(width: 230, height: 100))
    }
}
