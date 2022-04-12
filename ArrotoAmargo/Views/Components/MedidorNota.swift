//
//  MedidorNota.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 15/07/20.
//

import SwiftUI

struct MedidorNota: View {
    @State var nota: Int?
    
    var body: some View {
        let circleSize: CGFloat = 40
        let lineWidth: CGFloat = 7
        
        let existeNota = nota != nil
        let cor = existeNota ? Color.orange : Color.gray
        
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 0.75)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                    .opacity(0.3)
                    .foregroundColor(cor)
                    .rotationEffect(Angle(degrees: 135.0))
                    .frame(width: circleSize, height: circleSize, alignment: .center)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min((Float(self.nota ?? 0) / 10) * 0.75, 0.75)))
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                    .foregroundColor(cor)
                    .rotationEffect(Angle(degrees: 135.0))
                    .frame(width: circleSize, height: circleSize, alignment: .center)
                
                if existeNota {
                    Text(String(self.nota!))
                        .font(.title2)
                        .bold()
                } else {
                    Text("-")
                        .font(.title2)
                        .bold()
                }
            }
            Text("Nota")
                .font(.callout)
                .bold()
                .foregroundColor(cor)
                .offset(y: -6)
        }
    }
}

struct MedidorNota_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MedidorNota(nota: nil)
            MedidorNota(nota: 0)
            MedidorNota(nota: 1)
            MedidorNota(nota: 2)
            MedidorNota(nota: 3)
            MedidorNota(nota: 4)
            MedidorNota(nota: 5)
        }
        .previewLayout(.fixed(width: 50, height: 80))
        
        Group {
            MedidorNota(nota: 6)
            MedidorNota(nota: 7)
            MedidorNota(nota: 8)
            MedidorNota(nota: 9)
            MedidorNota(nota: 10)
        }
        .previewLayout(.fixed(width: 50, height: 80))
    }
}
