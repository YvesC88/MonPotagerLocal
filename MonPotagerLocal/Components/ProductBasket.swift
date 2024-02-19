//
//  CartView.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 08/02/2024.
//

import SwiftUI

struct ProductBasket: View {
    
    @EnvironmentObject var basketManager: BasketManager
    
    var product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 220)
                    .clipShape(.rect(cornerRadius: 20))
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.callout)
                    
                    Text("\(product.price)€")
                        .font(.caption)
                }
                .padding()
                .frame(width: 150, alignment: .leading)
                .background(.ultraThinMaterial).clipShape(.rect(cornerRadius: 20))
            }
            .frame(width: 150, height: 210)
            
            
            Button(action: {
                basketManager.addToBasket(product: product)
            }, label: {
                Image(systemName: "plus")
                    .padding(6)
                    .background(.ultraThinMaterial)
                    .clipShape(.circle)
                    .padding()
            })
        }
    }
}

#Preview {
    ProductBasket(product: productList[3])
        .environmentObject(BasketManager())
}
