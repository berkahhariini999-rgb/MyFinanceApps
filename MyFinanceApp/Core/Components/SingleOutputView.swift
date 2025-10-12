//
//  SingleOutputView.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 12/10/25.
//

import SwiftUI

struct SingleOutputView: View {
    let name: String
    let output: Double
    
    var body: some View {
        HStack {
            nameview
            Spacer()
            outputview
        }
    }
}

private extension SingleOutputView {
    var nameview: some View {
        Text(name)
            .font(.callout)
            .foregroundColor(Color.appTheme.secondaryText)
    }
    
    var outputview: some View {
        Text("$\(output.formattedWithTwoDecimals) ")
            .foregroundStyle(Color.appTheme.accent)
            .fontWeight(.semibold)
    }
}

#Preview {
    SingleOutputView(name: "Hourly Wage", output: 25.50)
        .padding()
        .infinityFrame()
        .background(Color.appTheme.viewBackground)
}
