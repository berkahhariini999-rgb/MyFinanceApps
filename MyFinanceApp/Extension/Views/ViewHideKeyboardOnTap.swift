//
//  ViewHideKeyboardOnTap.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 12/10/25.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboardOnTapGesture() -> some View {
        self.onTapGesture{
            hideKeyboard()
        }
    }
}
