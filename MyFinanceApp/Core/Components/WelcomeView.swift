//
//  WelcomeView.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    
    @State private var viewModel = WelcomeViewModel()
    @Binding var shouldShowWelcomeView: Bool
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
            .foregroundStyle(Color.gray)
    }
    
    var getStrtedButton: some View {
        Button {
            
        } label : {
           Text("Get Started")
        }
    }
}

#Preview {
    WelcomeView(shouldShowWelcomeView: .constant(true))
}
