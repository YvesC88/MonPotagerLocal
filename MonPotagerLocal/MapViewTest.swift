//
//  MapViewTest.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 09/02/2024.
//

import SwiftUI
import MapKit

struct MapViewTest: UIViewRepresentable {
    
    @EnvironmentObject var mapData: MapViewModel
    
    func makeCoordinator() -> Coordinator {
        return MapViewTest.Coordinator(mapData: mapData)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let view = mapData.mapView
        view.showsUserLocation = true
        view.delegate = context.coordinator
        
        return view
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        let mapData: MapViewModel
        
        init(mapData: MapViewModel) {
            self.mapData = mapData
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation.isKind(of: MKUserLocation.self) {
                return nil
            } else {
                let markerAnnotation = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "marker_view")
                markerAnnotation.animatesWhenAdded = true
                markerAnnotation.canShowCallout = true
                
                return markerAnnotation
            }
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotation) {
            
            guard !(view is MKUserLocation) else { return }
            
            if let place = mapData.selectedPlace {
                let detailPlaceView = DetailPlaceView(place: place)
                let hostingController = UIHostingController(rootView: detailPlaceView)
                UIApplication.shared.windows.first?.rootViewController?.present(hostingController, animated: true)
            }
        }
    }
}
