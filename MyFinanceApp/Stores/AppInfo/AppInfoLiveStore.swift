//
//  AppInfoLiveStore.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import Foundation

struct AppInfoLiveStore {
    let name: String = "My Finance"
    let description: String = "My Finance calculates your income from hourly rates or salary, including overtime, and provides detailed financial breakdowns"
    let developer: String = "Iqbal Alhadad"
    let website: String = "https://iqbalalhadad.com"
    let agreements: Agreements = .init()
    
    var version: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "-"
    }
    
    var compatibility: String {
        if let minVersion = Bundle.main.infoDictionary?["MinimumOSVersion"] as? String {
            return "iOS \(minVersion)"
        }
        return "-"
    }

    
}

extension AppInfoLiveStore {
    struct Agreements {
        let privacyPolicyUrl: String = "...."
        let termsAndConditionsUrl: String = "...."
        let copyrightPolicyUrl: String = "...."
        let disclaimerUrl: String = "...."
    }
}
