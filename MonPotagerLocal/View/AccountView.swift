//
//  AccountView.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 08/02/2024.
//

import SwiftUI

struct AccountView: View {
    
    @State var userName: String = "Yves"
    
    var body: some View {
        NavigationView {
            Text("Espace personnel")
            .navigationTitle("Bonjour \(userName)")
        }
    }
}

#Preview {
    AccountView()
}
