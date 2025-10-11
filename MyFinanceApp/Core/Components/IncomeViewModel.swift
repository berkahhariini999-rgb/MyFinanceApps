//
//  IncomeViewModel.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//
import Foundation
import Combine
import Factory


@MainActor
final class IncomeViewModel: ObservableObject {
    @Injected(\.incomeStore) var incomeStore
    @Injected(\.appInfoStore) var appInfoStore
    
    var appName: String {
        appInfoStore.name
    }
}
