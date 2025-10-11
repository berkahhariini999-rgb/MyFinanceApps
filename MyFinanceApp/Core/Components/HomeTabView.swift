//
//  HomeTabView.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
           incomeTabItemView
            settingsTabItemView
        }
    }
}

private extension HomeTabView {
    var incomeTabItemView : some View {
        NavigationStack {
            IncomeView()
        }
        .tabItem{
            Image(systemName: "dollarsign.square")
            Text("Income")
        }
    }
    
    var settingsTabItemView : some View {
        NavigationStack {
            SettingsView()
        }
        .tabItem{
            Image(systemName: "gearshape")
            Text("Settings")
        }
    }
}

#Preview {
    HomeTabView()
}
