//
//  Item.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 09/02/2024.
//

import SwiftUI

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    var quantity: Int
}

var productList = [Product(name: "Fraise", image: "fraise", price: 3, quantity: 0),
                   Product(name: "Concombre", image: "concombre", price: 10, quantity: 0),
                   Product(name: "Carotte", image: "carotte", price: 2, quantity: 0),
                   Product(name: "Pêche", image: "peche", price: 4, quantity: 0),
                   Product(name: "Pomme de terre", image: "pommedeterre", price: 5, quantity: 0),
                   Product(name: "Pomme", image: "pomme", price: 2, quantity: 0),
                   Product(name: "Aubergine", image: "aubergine", price: 2, quantity: 0),
                   Product(name: "Salade", image: "salade", price: 1, quantity: 0)
]
