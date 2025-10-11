//
//  AppStartingViewModel.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import Foundation
import Combine

@MainActor
final class AppStartingViewModel: ObservableObject {
    //alert view
    @Published var shouldShowWelcomeView:Bool = true
    
    
}
