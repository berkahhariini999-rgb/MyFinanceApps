//
//  MyFinanceAppApp.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 10/10/25.
//

import SwiftUI

@main
struct MyFinanceAppApp: App {
    @AppStorage(UserDefaultKeys.isDarkMode)
    private var isDarkMode: Bool = true
    var body: some Scene {
        WindowGroup {
            AppStartingView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
