//
//  BasketView.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 17/02/2024.
//

import SwiftUI

struct BasketView: View {
    
    @EnvironmentObject var basketManager: BasketManager
    
    var columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                        ProductBasket(product: product)
                            .environmentObject(basketManager)
                    }
                }
                .padding(5)
            }
    }
}

#Preview {
    BasketView()
        .environmentObject(BasketManager())
}
