//
//  MainView.swift
//  MySparTestCase
//
//  Created by Ruslan Magomedov on 30.01.2024.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab: Tab = .main
    
    init() {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().clipsToBounds = true
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag(Tab.main)
                    
                    Text("Каталог")
                        .tag(Tab.catalog)
                    
                    Text("Корзина")
                        .tag(Tab.cart)
                    
                    Text("Профиль")
                        .tag(Tab.profile)
                }
                
                CustomTabs(selectedTab: $selectedTab)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}, label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.green)
                            .font(.headline.weight(.bold))
                    })
                }
                
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: {}, label: {
                        Image(systemName: "doc.plaintext")
                            .foregroundColor(.green)
                            .font(.callout.weight(.semibold))
                    })
                    
                    Button(action: {}, label: {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.green)
                            .font(.callout.weight(.semibold))
                    })
                    
                    Button(action: {}, label: {
                        Image(systemName: "heart")
                            .foregroundColor(.green)
                            .font(.callout.weight(.semibold))
                    })
                }
            }
        }
    }
}

#Preview {
    MainView()
}
