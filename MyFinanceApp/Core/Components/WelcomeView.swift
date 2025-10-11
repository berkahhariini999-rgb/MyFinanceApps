//
//  WelcomeView.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import Foundation
import SwiftUI
import Factory

struct WelcomeView: View {
    
    @State private var viewModel = WelcomeViewModel()
    @Binding var shouldShowWelcomeView: Bool
    @Injected(\.appInfoStore) var appInfoStore
    var body: some View {
        VStack(spacing: 20) {
            title
            Spacer()
            VStack (spacing:0) {
                welcomeImage
                welcomeText
            }
            Spacer()
            getStrtedButton
        }
        .padding()
        .infinityFrame()
        .background(Color.appTheme.viewBackground)
    }
}

private extension WelcomeView {
    var title: some View {
        Text(viewModel.getAppName())
            .font(.title)
            .fontWeight(.bold)
    }
    
    var welcomeImage: some View {
        Image(.welcome)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
    }
    
    var welcomeText: some View {
        Text("Effortlessly calculate your Income.\n Let's get started!")
            .font(.title3)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .foregroundStyle(Color.appTheme.secondaryText)
    }
    
    var getStrtedButton: some View {
           Text("Get Started")
                .primaryButton()
                .button(.press) {
                    shouldShowWelcomeView = false
                }
        
    }
}

#Preview {
    WelcomeView(shouldShowWelcomeView: .constant(true))
}
