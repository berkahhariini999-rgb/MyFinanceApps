//
//  ViewButton.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import Foundation
import SwiftUI

struct PressablebuttonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.smooth, value: configuration.isPressed)
    }
}

enum ButtonStyleOption {
    case press, plain
}

extension View {
    @ViewBuilder
    func button (_ option: ButtonStyleOption = .plain, action: @escaping () -> Void) -> some View {
        switch option {
        case .press:
            self.pressableButton(action: action)
        case .plain:
            self.plainButton(action: action)
        }
    }
    
    
    private func plainButton (action: @escaping () -> Void) -> some View {
        Button{
            action()
        } label: {
            self
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func pressableButton (action: @escaping () -> Void) -> some View {
        Button{
            action()
        } label: {
            self
        }
        .buttonStyle(PressablebuttonStyle())
    }
}

fileprivate struct Preview: View {
    var body: some View {
        VStack(spacing: 24){
            Text("Continue")
                .primaryButton()
                .button(.press){
                    
                }
            Text("Conitinue")
                .primaryButton()
                .button{
                    
                }
        }
            .padding()
            .infinityFrame()
            .background(Color.appTheme.viewBackground)
    }
}

#Preview {
   Preview()
}
