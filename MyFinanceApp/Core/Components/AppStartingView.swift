//
//  ContentView.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 10/10/25.
//

import SwiftUI

struct AppStartingView: View {
    
    @StateObject private var viewModel = AppStartingViewModel()
    
    
    var body: some View {
        Group {
            if viewModel.shouldShowWelcomeView {
                WelcomeView(shouldShowWelcomeView: $viewModel.shouldShowWelcomeView)
            } else {
                HomeTabView()
            }
        }
        .animation(.easeIn, value: viewModel.shouldShowWelcomeView)
    }
}

#Preview {
    AppStartingView()
}
