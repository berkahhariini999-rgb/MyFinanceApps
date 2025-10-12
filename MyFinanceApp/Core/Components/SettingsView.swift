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
        Text("Settings View")
    }
}

#Preview {
    SettingsView()
}
