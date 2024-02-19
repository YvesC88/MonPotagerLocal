//
//  SearchBar.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 09/02/2024.
//

import SwiftUI

struct SearchBar: View {
    
    @StateObject var mapData = MapViewModel()
    
    @Binding var text: String
    var onSearchButtonClicked: () -> Void
    
    var body: some View {
        VStack {
            Spacer().frame(height: 40)
            HStack {
                Button(action: {
                    self.onSearchButtonClicked()
                }) {
                    Image(systemName: "magnifyingglass")
                }
                
                TextField("Recherche", text: $mapData.searchText)
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
            }
            .padding().frame(width: 300)
            .background(.thinMaterial)
            .clipShape(.capsule)
            Spacer()
        }
    }
}
