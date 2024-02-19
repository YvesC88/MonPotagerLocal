//
//  Marker.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 09/02/2024.
//

import SwiftUI
import MapKit

enum SaleType: String {
    case maraicher = "Maraîcher"
    case epicerie = "Épicerie"
    case producteurBio = "Producteur Bio"
    case fermeLocale = "Ferme locale"
}

enum SaleImage: String {
    case fraise = "fraise"
    case pommedeterre = "pommedeterre"
    case peche = "peche"
    case carotte = "carotte"
    case courgette = "courgette"
}

struct Place: Identifiable {
    let id = UUID().uuidString
    let title: String
    let locality: String
    let placeImage: [String]
    let coordinate: CLLocationCoordinate2D?
    let description: String
}

struct PlaceList {
    
    static let list = [
        Place(title: "Chez William", locality: "Montpellier", placeImage: ["producteur1", "producteur2", "producteur3"], coordinate: CLLocationCoordinate2D(latitude: 43.59438738571344, longitude: 3.8856880631710875), description: "Bienvenue à la ferme de William, où la nature prospère en harmonie. William cultive une grande variété de fruits et légumes avec amour et respect pour l'environnement.\n Sans pesticides ni produits chimiques synthétiques, sa ferme est un havre de biodiversité où les méthodes agricoles durables préservent la terre pour les générations futures."),
        Place(title: "Maraîchers Bio de Grabels", locality: "Grabels", placeImage: [SaleImage.pommedeterre.rawValue], coordinate: CLLocationCoordinate2D(latitude: 43.654021390247834, longitude: 3.818078906825667), description: "La pomme de terre ou patate (dans le registre informel ou bien en français canadien, suisse ou belge) est un tubercule comestible produit par l’espèce Solanum tuberosum, appartenant à la famille des solanacées. Le terme désigne également la plante elle-même, plante herbacée, vivace par ses tubercules mais toujours cultivée comme une culture annuelle."),
        Place(title: "Fred producteur", locality: "Le Crès", placeImage: [SaleImage.fraise.rawValue], coordinate: CLLocationCoordinate2D(latitude: 43.66331635156326, longitude: 3.9341394263737), description: "Ce fruit rouge est botaniquement parlant un faux-fruit ; il s'agit en réalité d'un réceptacle charnu sur lequel sont disposés régulièrement des akènes dans des alvéoles plus ou moins profondes. La fraise est donc un polyakène."),
        Place(title: "Mon Maraîcher", locality: "Montpellier", placeImage: [SaleImage.peche.rawValue], coordinate: CLLocationCoordinate2D(latitude: 43.594984821459704, longitude: 3.900391797826057), description: "Les pêches sont des fruits climactériques charnus, juteux et sucrés, avec une chair jaune, blanche, ou rouge (sanguine), une peau veloutée de couleur jaune ou orange plus ou moins lavée de rose-carmin à rose-saumon ou brune chez les sanguines, et un noyau dur, adhérent ou non."),
        Place(title: "La ferme du Chot", locality: "Lavérune", placeImage: [SaleImage.courgette.rawValue], coordinate: CLLocationCoordinate2D(latitude: 43.578405305924235, longitude: 3.8071850039225246), description: "La courgette appartient à la famille des cucurbitacées. C'est une plante potagère qui pousse au sol en buisson. Le jeune plant provient d'une graine qui germe au contact de l'eau et de la terre. Les deux premières feuilles sont appelés cotylédon qui servent à nourrir le jeune plant puis qui tombent. Puis, les feuilles apparaissent. Les fleurs sont de couleur jaune. Il y a des fleurs mâles et des fleurs femelles qui seules donnent le fruit appelé également courgette.")
    ]
}
