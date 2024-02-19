//
//  ProductRow.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 18/02/2024.
//

import SwiftUI

struct ProductRow: View {
    
    @EnvironmentObject var basketManager: BasketManager
    var product: Product
    
    var body: some View {
        HStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .clipShape(.rect(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .bold()
                
                Text("\(product.price)€")
            }
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundStyle(.red)
                .onTapGesture {
                    basketManager.removeFromBasket(product: product)
                }
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
}


#Preview {
    ProductRow(product: productList[2])
        .environmentObject(BasketManager())
}
