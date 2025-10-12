//
//  PayOutputRowView.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 12/10/25.
//

import SwiftUI

struct PayOutputRowView: View {
    
    let name : String
    let output: Double
    var body: some View {
        HStack(spacing: 16){
            nameView
            Spacer()
            outputView
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .background(Color.gray.opacity(0.6))
        .cornerRadius(.cell)
    }
}

private extension PayOutputRowView {
    var nameView: some View {
    Text(name)
            .font(.callout)
            .foregroundStyle(Color.black)
            .fontWeight(.bold)
    }
    var outputView: some View {
        Text("$ \(output.formattedAsWholeCurrencyOrInvalid)")
            .foregroundStyle(Color.appTheme.accent)
            .fontWeight(.semibold)
    }
}

#Preview {
    PayOutputRowView(name: "Weekly", output: 1_117)
        .padding()
        .infinityFrame()
        .background(Color.appTheme.viewBackground)
}
