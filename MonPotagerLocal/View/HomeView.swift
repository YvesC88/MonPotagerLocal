//
//  HomeView.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 08/02/2024.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Bienvenue !")
                    .navigationTitle("Actualités")
                    .font(.system(size: 25, weight: .light, design: .rounded))
                
            }
        }
    }
}

#Preview {
    HomeView()
}
