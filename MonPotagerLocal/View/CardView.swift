//
//  CardView.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 18/02/2024.
//

import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var basketManager: BasketManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                if basketManager.products.count > 0 {
                    ForEach(basketManager.products, id: \.id) { product in
                        ProductRow(product: product)
                    }
                    
                    HStack {
                        Text("Votre panier total est")
                        Spacer()
                        Text("\(basketManager.total).00€")
                            .bold()
                    }
                    .padding()
                } else {
                    Text("Votre panier est vide")
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    CardView()
        .environmentObject(BasketManager())
}
