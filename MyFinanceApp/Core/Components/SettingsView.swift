//
//  SettingsView.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @AppStorage(UserDefaultKeys.isDarkMode)
    private var isDarkMode = true
    var body: some View {
        ScrollView {
            VStack(spacing: 16){
                
            }
            .padding()
        }
        .infinityFrame()
        .background(Color.gray.opacity(0.6))
    }
}

#Preview {
    SettingsView()
}
