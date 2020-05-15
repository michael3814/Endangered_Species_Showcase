//
//  MapView.swift
//  Endangered Species
//
//  Created by Michael Chung on 4/23/20.
//  Copyright © 2020 MC. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coordinates: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        // Width and Height of map showing
        let span = MKCoordinateSpan(latitudeDelta: 20.0, longitudeDelta: 20.0)
        
        // Setting the region
        let region = MKCoordinateRegion(center: coordinates, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinates: animalData[0].locationCoordinate)
    }
}
