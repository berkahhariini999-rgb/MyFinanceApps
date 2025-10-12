//
//  ViewInputTextField.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 12/10/25.
//

import SwiftUI

extension View {
    func inputTextField() -> some View {
        self
            .keyboardType(.decimalPad)
            .padding(12)
            .frame(maxWidth:.infinity)
            .background(Color.cellBackground)
            .cornerRadius(.textfield)
            .shadow(.regular)
    }
}
