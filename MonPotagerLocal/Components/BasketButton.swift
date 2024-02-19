//
//  BasketButton.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 17/02/2024.
//

import SwiftUI

struct BasketButton: View {
    
    var numberOfProducts: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Image(systemName: "basket")
                .padding(.top, 5)
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .foregroundStyle(.white)
                    .frame(width: 15, height: 15)
                    .background(.red)
                    .clipShape(.circle)
            }
        }
    }
}

#Preview {
    BasketButton(numberOfProducts: 1)
}
