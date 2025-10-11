//
//  WelcomeViewModel.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import Foundation
import Combine
import Factory

@MainActor
final class WelcomeViewModel: ObservableObject {
    @Injected(\.appInfoStore) var appInfoStore
    
    
    func getAppName() -> String {
       // "My Finance"
        appInfoStore.name
    }
    
    
}
