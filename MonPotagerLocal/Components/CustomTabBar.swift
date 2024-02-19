//
//  CustomTabBar.swift
//  MonPotagerLocal
//
//  Created by Yves Charpentier on 07/02/2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house, carrot, person, gearshape
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .blue
        case .carrot:
            return .orange
        case .person:
            return .green
        case .gearshape:
            return .gray
        }
    }
    
    var body: some View {
        Spacer()
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Spacer()
                Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                    .scaleEffect(tab == selectedTab ? 1.5 : 1.25)
                    .foregroundStyle(selectedTab == tab ? tabColor : .secondary)
                    .font(.system(size: 20))
                    .onTapGesture {
                        selectedTab = tab
                    }
                Spacer()
            }
        }
        .frame(height: 60)
        .background(.thickMaterial)
        .clipShape(.rect(cornerRadius: 22))
        .padding()
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.house))
}
