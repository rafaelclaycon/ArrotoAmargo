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
        ZStack {
            Circle()
                .trim(from: 0.0, to: 0.75)
                .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
                .opacity(0.3)
                .foregroundColor(Color.yellow)
                .rotationEffect(Angle(degrees: 135.0))
                .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min((Float(self.nota)/5)*0.75, 0.75)))
                .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.orange)
                .rotationEffect(Angle(degrees: 135.0))
                .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text(String(self.nota))
                .font(.body)
                .bold()
        }
    }
}

struct MedidorNota_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MedidorNota(nota: 1)
            MedidorNota(nota: 2)
            MedidorNota(nota: 3)
            MedidorNota(nota: 4)
            MedidorNota(nota: 5)
        }
        .previewLayout(.fixed(width: 40, height: 40))
    }
}
