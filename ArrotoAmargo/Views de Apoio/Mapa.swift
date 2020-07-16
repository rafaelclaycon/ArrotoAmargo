//
//  Mapa.swift
//  ArrotoAmargo
//
//  Created by Rafael Claycon Schmitt on 14/07/20.
//

import SwiftUI
import MapKit

struct Mapa: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct Mapa_Previews: PreviewProvider {
    static var previews: some View {
        Mapa(coordinate: avaliacaoDados[0].locationCoordinate)
    }
}
