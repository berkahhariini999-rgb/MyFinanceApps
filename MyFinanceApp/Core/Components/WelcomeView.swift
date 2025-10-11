//
//  WelcomeView.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    
    @Binding var shouldShowWelcomeView: Bool
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome View")
            Button {
                shouldShowWelcomeView = false
            } label: {
                Text("Get Started")
            }
        }
    }
}

#Preview {
    WelcomeView(shouldShowWelcomeView: .constant(true))
}
