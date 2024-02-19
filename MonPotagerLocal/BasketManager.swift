//
//  BasketManager.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 18/02/2024.
//

import Foundation

class BasketManager: ObservableObject {
    
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    func addToBasket(product: Product) {
        products.append(product)
        total += product.price
    } 
    
    func removeFromBasket(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
}
