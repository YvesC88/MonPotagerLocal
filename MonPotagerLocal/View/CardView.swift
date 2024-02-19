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
                    let idProduct = Dictionary(grouping: basketManager.products) { $0.id }
                    
                    ForEach(idProduct.keys.sorted(), id: \.self) { key in
                        if let product = idProduct[key]?.first {
                            ProductRow(product: product, quantity: idProduct[key]?.count ?? 0)
                        }
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
            .navigationTitle("Panier")
        }
    }
}

#Preview {
    CardView()
        .environmentObject(BasketManager())
}
