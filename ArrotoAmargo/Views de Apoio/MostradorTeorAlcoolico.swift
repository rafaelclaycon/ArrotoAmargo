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
        VStack() {
            Text("TEOR ALCOÓLICO")
                .font(.callout)
                .foregroundColor(.gray)
                .bold()
                .offset(y: 8)
            
            ZStack() {
                let YPosition = CGFloat(10)
                
                Path { path in
                    path.move(to: CGPoint(x: 40, y: YPosition))
                    path.addLine(to: CGPoint(x: 160, y: YPosition))
                }
                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .foregroundColor(.gray)
                
                let innerCircleXOffset = CGFloat(35 + (12 * valor))
                let outterCircleXOffset = CGFloat(32 + (12 * valor))
                
                ZStack() {
                    Circle()
                        .size(width: 16, height: 16)
                        .offset(x: outterCircleXOffset, y: YPosition - 8)
                        .foregroundColor(Color.background)
                        .blendMode(.color)
                    Circle()
                        .size(width: 10, height: 10)
                        .offset(x: innerCircleXOffset, y: YPosition - 5)
                        .foregroundColor(Color.gray)
                }
                
            }
            
            Text(texto)
                .font(.body)
                .bold()
                .offset(y: -6)
        }
    }
}

struct MostradorTeorAlcoolico_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MostradorTeorAlcoolico(valor: 0, texto: "0%")
                //.preferredColorScheme(.dark)
            MostradorTeorAlcoolico(valor: 5, texto: "5%")
            MostradorTeorAlcoolico(valor: 8.1, texto: "8,1%")
            MostradorTeorAlcoolico(valor: 9, texto: "9%")
            MostradorTeorAlcoolico(valor: 10, texto: "10%")
        }
            .previewLayout(.fixed(width: 200, height: 80))
    }
}
