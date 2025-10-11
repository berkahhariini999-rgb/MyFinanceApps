//
//  ViewInfinity.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import SwiftUI

extension View {
    func infinityFrame() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
