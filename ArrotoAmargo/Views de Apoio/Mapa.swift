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
    var span: CLLocationDegrees = 0.02
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Span serve para definir o nível de zoom que se quer no mapa. Valores MENORES (0.002) dão MAIS zoom.
        let span = MKCoordinateSpan(latitudeDelta: self.span, longitudeDelta: self.span)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct Mapa_Previews: PreviewProvider {
    static var previews: some View {
        Mapa(coordinate: cervejaDados[0].locationCoordinate)
    }
}
