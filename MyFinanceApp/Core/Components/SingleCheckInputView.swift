//
//  SingleCheckInputView.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 12/10/25.
//

import SwiftUI

struct SingleCheckInputView: View {
    
    let name: String
    @Binding var isChecked: Bool
    var body: some View {
        HStack {
            nameView
            Spacer()
            checkButtonView
        }
    }
}

private extension SingleCheckInputView {
    var nameView: some View {
        Text(name)
            .font(.callout)
            .fontWeight(.medium)
            .foregroundStyle(Color.appTheme.accent)
    }
    
    var checkButtonView: some View {
        Image(systemName: isChecked ? "checkmark.square" : "square")
            .font(.title2)
            .foregroundStyle(Color.appTheme.accent)
            .button {
                withAnimation{
                    isChecked.toggle()
                }
            }
    }
}

#Preview {
    Preview()
}

fileprivate struct Preview: View {
    @State private var isChecked: Bool = false
    
    var body: some View {
        SingleCheckInputView(name: "Overtime Rate", isChecked: $isChecked)
            .padding()
            .infinityFrame()
            .background(Color.appTheme.viewBackground)
    }
}
