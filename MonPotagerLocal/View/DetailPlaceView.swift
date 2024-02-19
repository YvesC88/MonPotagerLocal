//
//  DetailPlaceView.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 12/02/2024.
//

import SwiftUI
import MapKit

struct DetailPlaceView: View {
    
    @EnvironmentObject var mapData: MapViewModel
    
    @StateObject var basketManager = BasketManager()
    
    @Environment(\.dismiss) private var dismiss
    
    let place: Place
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    imageSection
                        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
                    VStack(alignment: .leading, spacing: 16) {
                        titleSection
                        Divider()
                        descriptionSection
                        moreInformation
                        Divider()
                        productsSection
                            .environmentObject(basketManager)
                    }
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
                
            }
            .ignoresSafeArea()
            .background(.ultraThinMaterial)
            .overlay(backButton, alignment: .topLeading)
            .overlay(basketButton, alignment: .topTrailing)
        }
    }
}

extension DetailPlaceView {
    
    private var imageSection: some View {
        TabView {
            ForEach(place.placeImage, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 450)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(place.title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(place.locality)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(place.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    private var moreInformation: some View {
        HStack {
            if let url = URL(string: "https://www.google.fr") {
                Link("Lire plus d'informations", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    
    private var productsSection: some View {
        BasketView()
    }
    
    private var backButton: some View {
        
        Button(action: { dismiss() }, label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(12)
                .background(.thinMaterial)
                .clipShape(.circle)
                .shadow(radius: 4)
                .padding()
        })
    }
    
    private var basketButton: some View {
        NavigationLink {
            CardView()
                .environmentObject(basketManager)
        } label: {
            BasketButton(numberOfProducts: basketManager.products.count)
                .font(.headline)
                .padding(9)
                .background(.thinMaterial)
                .clipShape(.circle)
                .shadow(radius: 4)
                .padding()
        }
    }
}

#Preview {
    DetailPlaceView(place: Place(title: "Mr. Durand", locality: "Lattes", placeImage: ["producteur1", "producteur2", "producteur3"], coordinate: CLLocationCoordinate2D(latitude: 34, longitude: 34), description: "Maraîcher spécialisé dans la ventes de légumes en tous genres ainsi que des fruits de saison. Il est localisé dans la commune de Lattes depuis près de 10 ans.\nSa passion pour la jardinage en fait de lui un cultivateur d'exception."))
}
