//
//  CustomTabs.swift
//  MySparTestCase
//
//  Created by Ruslan Magomedov on 31.01.2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case main = "Главная"
    case catalog = "Каталог"
    case cart = "Корзина"
    case profile = "Профиль"
    
    var image: String {
        switch self {
        case .main: return "arrow.up.circle"
        case .catalog: return "rectangle.grid.2x2"
        case .cart: return "cart"
        case .profile: return "person"
        }
    }
}

struct CustomTabs: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Spacer()
                VStack {
                    Image(systemName: tab.image)
                        .font(.title3.weight(.bold))
                        .foregroundColor(selectedTab == tab ? .green : .black)
                        .onTapGesture {
                            withAnimation {
                                selectedTab = tab
                            }
                        }
                    
                    Text(tab.rawValue)
                        .font(.caption)
                        .foregroundColor(selectedTab == tab ? .green : .black)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    CustomTabs(selectedTab: .constant(.main))
}
