//
//  CervejariaCelula.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 25/07/20.
//

import SwiftUI
import CoreLocation

struct CervejariaCelula: View {
    var body: some View {
        HStack {
            ImageStore.shared.image(name: "logo_imigracao")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .padding(.leading, 20)
            VStack(alignment: .leading) {
                Text("Imigração")
                    .font(.title3)
                    .bold()
                    //.padding()
                Spacer()
                Text("Campo Bom, RS - Brasil")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    //.padding()
            }
            .padding()
            Spacer()
            Mapa(coordinate: CLLocationCoordinate2D(latitude: -29.67694208, longitude: -51.06510758))
                .frame(width: 80, height: 78, alignment: .trailing)
        }
    }
}

struct CervejariaCelula_Previews: PreviewProvider {
    static var previews: some View {
        CervejariaCelula()
            .previewLayout(.fixed(width: 360, height: 78))
    }
}
