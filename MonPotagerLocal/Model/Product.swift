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
}

var productList = [Product(name: "Fraise", image: "fraise", price: 3),
                   Product(name: "Concombre", image: "concombre", price: 10),
                   Product(name: "Carotte", image: "carotte", price: 2),
                   Product(name: "Pêche", image: "peche", price: 4),
                   Product(name: "Pomme de terre", image: "pommedeterre", price: 5),
                   Product(name: "Pomme", image: "pomme", price: 2),
                   Product(name: "Aubergine", image: "aubergine", price: 2),
                   Product(name: "Salade", image: "salade", price: 1)
]
