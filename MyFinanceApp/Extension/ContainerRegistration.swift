//
//  ContainerRegistration.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import Factory

extension Container {
    var appInfoStore:Factory<AppInfoLiveStore> {
        self{
            MainActor.assumeIsolated{
                AppInfoLiveStore()
            }
        }.singleton
    }
    
    var incomeStore:Factory<IncomeStore> {
        self{
            MainActor.assumeIsolated{
              IncomeLiveStore()
            }
        }.singleton
    }
}
