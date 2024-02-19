//
//  ContentView.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 07/02/2024.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        VStack {
                            switch tab {
                            case .house:
                                HomeView()
                            case .carrot:
                                MapView()
                            case .person:
                                AccountView()
                            case .gearshape:
                                SettingsView()
                            }
                        }
                        .tag(tab)
                    }
                }
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
    }
}

#Preview {
    ContentView()
}
