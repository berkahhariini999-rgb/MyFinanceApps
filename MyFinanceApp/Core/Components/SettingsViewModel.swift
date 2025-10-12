//
//  SettingsViewModel.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 12/10/25.
//

import Foundation
import Combine
import Factory

@MainActor
final class SettingsViewModel: ObservableObject {
    @Injected(\.appInfoStore) var appInfoStore
    
    var applicationData: InfoBoxView.Data {
        .init(
            title: "Application",
            sfSymbol: "apps.iphone",
            infoData: [
                .init(title: "Developer", description: appInfoStore.developer),
                .init(title: "Version", description: appInfoStore.version),
                .init(title: "Compatibility", description: appInfoStore.compatibility),
                .init(title: "Website", urlString: appInfoStore.website)
                
            ])
    }
    
    var agreementsData: InfoBoxView.Data {
        .init(
            title: "Agreements",
            sfSymbol: "doc.text.magnifyingglass",
            infoData: [
                .init(title: "Privacy Policy", urlString: appInfoStore.agreements.privacyPolicyUrl),
                .init(title: "Terms & Condition", urlString:
                        appInfoStore.agreements.termsAndConditionsUrl),
                .init(title: "Copyright Policy", urlString:
                        appInfoStore.agreements.copyrightPolicyUrl),
                .init(title: "Disclaimer", urlString:
                        appInfoStore.agreements.disclaimerUrl)
            ])
    }
    
}
