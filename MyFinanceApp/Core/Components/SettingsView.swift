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
              introBoxView
                customizationBoxView
            }
            .padding()
        }
        .infinityFrame()
        .background(Color.gray.opacity(0.6))
    }
}

private extension SettingsView {
    var introBoxView: some View {
        IntroBoxView(data: .init(title: viewModel.getAppName(), sfSymbol: "info.circle", imageName: "AppIconImage", description: viewModel.getAppDescription()))
    }
    
    var customizationBoxView: some View {
        BoxView(data: .init(title: "Customization", sfSymbol: "paintbrush")){
            Toggle("Dark Mode", isOn: $isDarkMode)
                .tint(.appTheme.accent)
        }
    }
    
    
}

#Preview {
    SettingsView()
}
