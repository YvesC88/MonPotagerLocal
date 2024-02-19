//
//  UIApplicationDelegate.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 14/02/2024.
//

import UIKit
import GooglePlaces

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GMSPlacesClient.provideAPIKey("AIzaSyC0rNQ1fBDUHfTuTtIOYOzUnEQmHL4PxyE")
    }
    
}
