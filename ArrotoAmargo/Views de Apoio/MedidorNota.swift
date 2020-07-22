//
//  MedidorNota.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 15/07/20.
//

import SwiftUI

struct MedidorNota: View {
    @State var nota: Int
    
    var body: some View {
        let circleSize: CGFloat = 40
        let lineWidth: CGFloat = 7
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 0.75)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                    .opacity(0.3)
                    .foregroundColor(.orange)
                    .rotationEffect(Angle(degrees: 135.0))
                    .frame(width: circleSize, height: circleSize, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min((Float(self.nota) / 5) * 0.75, 0.75)))
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.orange)
                    .rotationEffect(Angle(degrees: 135.0))
                    .frame(width: circleSize, height: circleSize, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Text(String(self.nota))
                    .font(.title2)
                    .bold()
            }
            Text("Nota")
                .font(.callout)
                .bold()
                .foregroundColor(.orange)
                .offset(y: -6)
        }
    }
}

struct MedidorNota_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MedidorNota(nota: 0)
            MedidorNota(nota: 1)
            MedidorNota(nota: 2)
            MedidorNota(nota: 3)
            MedidorNota(nota: 4)
            MedidorNota(nota: 5)
        }
        .previewLayout(.fixed(width: 50, height: 70))
    }
}
