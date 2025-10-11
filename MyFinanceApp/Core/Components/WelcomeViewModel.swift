//
//  WelcomeViewModel.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import Foundation
import Combine

@MainActor
final class WelcomeViewModel: ObservableObject {
    
    func getAppName() -> String {
        "My Finance"
    }
    
    
}
