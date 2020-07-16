//
//  MedidorIBU.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 15/07/20.
//

import SwiftUI

struct MedidorIBU: View {
    @State var valor: Int
    
    var body: some View {
        let circleSize: CGFloat = 44
        let lineWidth: CGFloat = 4
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 0.75)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                    .rotationEffect(Angle(degrees: 135.0))
                    .frame(width: circleSize, height: circleSize, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min((Float(self.valor)/90)*0.75, 0.75)))
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.gray)
                    .rotationEffect(Angle(degrees: 135.0))
                    .frame(width: circleSize, height: circleSize, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Text(String(self.valor))
                    .font(.title3)
                    .bold()
            }
            Text("IBU")
                .font(.callout)
                .bold()
                .foregroundColor(.gray)
                .offset(y: -6)
        }
    }
}

struct MedidorIBU_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MedidorIBU(valor: 1)
            MedidorIBU(valor: 64)
            MedidorIBU(valor: 90)
        }
        .previewLayout(.fixed(width: 60, height: 80))
    }
}
