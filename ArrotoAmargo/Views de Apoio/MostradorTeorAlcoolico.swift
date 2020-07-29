//
//  MostradorTeorAlcoolico.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 28/07/20.
//

import SwiftUI

struct MostradorTeorAlcoolico: View {
    @State var valor: Float
    @State var texto: String
    
    var body: some View {
        ZStack() {
            Text("TEOR ALCÓOLICO")
                .font(.callout)
                .foregroundColor(.gray)
                .bold()
                .offset(y: -24)
            
            Path { path in
                path.move(to: CGPoint(x: 40, y: 40))
                path.addLine(to: CGPoint(x: 160, y: 40))
            }
            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
            .foregroundColor(.gray)
            
            let innerCircleXOffset = CGFloat(35 + (12 * valor))
            let outterCircleXOffset = CGFloat(33 + (12 * valor))
            
            Circle()
                .size(width: 10, height: 10)
                .offset(x: innerCircleXOffset, y: 35)
                .overlay(
                    Circle()
                        .size(width: 13, height: 13)
                        .offset(x: outterCircleXOffset, y: 33)
                        .stroke(Color.white.opacity(1), lineWidth: 3)
                        .blendMode(.lighten)
                )
                .foregroundColor(Color.gray.opacity(1))
            
            Text(texto)
                .font(.body)
                .bold()
                .offset(y: 24)
        }
    }
}

struct MostradorTeorAlcoolico_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MostradorTeorAlcoolico(valor: 0, texto: "0%")
            MostradorTeorAlcoolico(valor: 5, texto: "5%")
            MostradorTeorAlcoolico(valor: 8.1, texto: "8,1%")
            MostradorTeorAlcoolico(valor: 9, texto: "9%")
            MostradorTeorAlcoolico(valor: 10, texto: "10%")
        }
            .previewLayout(.fixed(width: 200, height: 80))
    }
}
