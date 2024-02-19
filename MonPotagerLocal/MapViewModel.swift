//
//  MapViewModel.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 09/02/2024.
//

import SwiftUI
import MapKit
import GooglePlaces

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var mapView = MKMapView()
    
    @Published var region: MKCoordinateRegion!
    
    @Published var permissionDenied = false
    
    @Published var mapType: MKMapType = .standard
    
    @Published var searchText = ""
    
    @Published var places: [Place] = []
    
    @Published var selectedPlace: Place?
    
    @Published var googlePlaces: [MKPointAnnotation] = []
    
    func updateMapType() {
        mapType = (mapType == .standard) ? .hybrid : .standard
        mapView.mapType = mapType
    }
    
    // Focus location
    
    func focusUserLocation() {
        guard let _ = region else { return }
        mapView.setRegion(region, animated: true)
    }
    
    func searchQuery() {
        places.removeAll()
        
        guard !searchText.isEmpty else {
            self.places = PlaceList.list
            return
        }
        self.places = PlaceList.list.filter { place in
            return place.title.localizedCaseInsensitiveContains(searchText) || place.locality.localizedCaseInsensitiveContains(searchText)
        }
        
    }
    
//    func searchPlaces(query: String) {
//        let placesClient = GMSPlacesClient()
//        let autocompleteFilter = GMSAutocompleteFilter()
//        autocompleteFilter.type = .establishment
//        
//        let token = GMSAutocompleteSessionToken.init()
//        
//        placesClient.findAutocompletePredictions(fromQuery: query, filter: autocompleteFilter, sessionToken: token) { (predictions, error) in
//            guard error == nil, let predictions = predictions else {
//                print("Autocomplete error: \(String(describing: error))")
//                return
//            }
//            
//            for prediction in predictions {
//                placesClient.lookUpPlaceID(prediction.placeID) { (place, error) in
//                    guard error == nil, let place = place else {
//                        print("Place lookup error: \(String(describing: error))")
//                        return
//                    }
//                    
//                    let annotation = MKPointAnnotation()
//                    annotation.coordinate = place.coordinate
//                    annotation.title = place.name
//                    annotation.subtitle = place.formattedAddress
//                    self.googlePlaces.append(annotation)
//                }
//            }
//        }
//    }

    
    func distanceToAnnotation(place: Place, locationManager: CLLocationManager) -> String {
        guard let latitude = place.coordinate?.latitude, let longitude = place.coordinate?.longitude else { return "" }
        
        let annotationCLLocation = CLLocation(latitude: latitude, longitude: longitude)
        
        guard let distance = locationManager.location?.distance(from: annotationCLLocation) else { return "" }
        
        saveDistanceToUserDefaults(distance: String(format: "%.1f km", distance / 1000))
        
        return String(format: "%.1f km", distance / 1000)
    }
    
    func saveDistanceToUserDefaults(distance: String) {
        UserDefaults.standard.set(distance, forKey: "distanceToAnnotation")
    }
    
    func selectPlace(place: Place) {
        searchText = ""
        guard let coordinate = place.coordinate else { return}
        
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.coordinate = coordinate
        pointAnnotation.title = place.title
        
        self.selectedPlace = place
        
        mapView.removeAnnotations(mapView.annotations)
        
        mapView.addAnnotation(pointAnnotation)
        
        // Moving map to that location
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch manager.authorizationStatus {
        case .denied:
            permissionDenied.toggle()
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            manager.requestLocation()
        case .authorizedAlways:
            manager.requestAlwaysAuthorization()
        default:
            ()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        
        self.region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        
        self.mapView.setRegion(self.region, animated: true)
    }
}
