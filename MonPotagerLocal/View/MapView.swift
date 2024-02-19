//
//  MapView.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 07/02/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject var mapData = MapViewModel()
    
    @FocusState private var isFocused: Bool
    
    @State var locationManager = CLLocationManager()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            MapViewTest()
                .environmentObject(mapData)
                .ignoresSafeArea(.all, edges: .all)
                .onTapGesture {
                    isFocused = false
                }
            
            VStack {
                searchingSection
                    .padding()
                buttonSection
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                Spacer()
            }
        }
        .onAppear(perform: {
            locationManager.delegate = mapData
            locationManager.requestLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            dismiss()
        })
        .alert(isPresented: $mapData.permissionDenied, content: {
            Alert(title: Text("Permission refusée"), message: Text("Veuillez s'il vous plaît accepter les autorisations dans les réglages de l'application"), dismissButton: .default(Text("Réglages"), action: {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }))
        })
        .onChange(of: mapData.searchText) { value in
            if value == mapData.searchText {
                self.mapData.searchQuery()
            }
            
        }
    }
}

#Preview {
    MapView()
}

extension MapView {
    
    private var searchSection: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
            
            TextField("Rechercher", text: $mapData.searchText)
                .foregroundStyle(.secondary)
                .focused($isFocused)
            if !mapData.searchText.isEmpty {
                Button(action: { mapData.searchText = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
    }
    
    private var buttonSection: some View {
        VStack(spacing: 10) {
            Button(action: mapData.focusUserLocation, label: {
                Image(systemName: "location.fill")
                    .font(.title2)
                    .padding(10)
                    .background(.thinMaterial)
                    .clipShape(.circle)
            })
            
            Button(action: mapData.updateMapType, label: {
                Image(systemName: mapData.mapType == .standard ? "network" : "map")
                    .font(.title2)
                    .padding(10)
                    .background(.thinMaterial)
                    .clipShape(.circle)
            })
        }
    }
    
    private var searchResultSection: some View {
        ForEach(mapData.places) { place in
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(place.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                        .padding(5)
                    Text(place.locality)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                        .padding(5)
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                }
                Text("\(mapData.distanceToAnnotation(place: place, locationManager: locationManager))")
                    .padding(.trailing)
                    .font(.system(size: 13))
                    .foregroundStyle(.secondary)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                mapData.selectPlace(place: place)
                isFocused = false
            }
            Divider()
        }
    }
    
    private var searchingSection: some View {
        VStack(spacing: 8) {
            searchSection
                .padding(15)
                .padding(.horizontal)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 22))
            
            if !mapData.places.isEmpty && !mapData.searchText.isEmpty {
                ScrollView {
                    VStack(spacing: 15) {
                        searchResultSection
                    }
                    .padding(.top)
                }
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 22))
            }
        }
    }
}
