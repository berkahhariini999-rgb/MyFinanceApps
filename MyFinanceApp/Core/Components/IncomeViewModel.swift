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
    @Published var incomePickerValue: IncomePickerView.IncomeType = .salary
    
    @Published var salaryInput: SalaryInput = .init()
    @Published var salaryOutput: SalaryOutput = .init()
    
    @Published var hourlyInput: HourlyInput = .init()
    @Published var hourlyOutput: HourlyOutput = .init()
    
    @Injected(\.incomeStore) var incomeStore
    @Injected(\.appInfoStore) var appInfoStore
    
    var shouldShowOvertimeCheck: Bool {
        (hourlyInput.hoursPerWeek ?? 0) >  hourlyInput.hoursPerWeekLimitOvertime
    }
    
    var appName: String {
        appInfoStore.name
    }
}
