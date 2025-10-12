//
//  PayOutputView.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 12/10/25.
//

import SwiftUI

struct PayOutputView: View {
    let pay:Pay
    var body: some View {
        VStack (spacing:12){
            
        }
        .frame(maxWidth:.infinity)
        .padding(12)
        .background()
    }
}

#Preview {
    PayOutputView(
        pay: .init(
            incomeType: .gross,
            weekly: 1_117,
            biWeekly: 2_235,
            fourWeekly: 4_469,
            monthly: 4_838,
            yearly: 58_100
        )
    )
    .padding()
    .infinityFrame()
    .background(Color.appTheme.viewBackground)
}
