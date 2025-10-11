//
//  HourlyOutput.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import Foundation

struct HourlyOutput {
    let takeHomePay: Pay
    let grossPay: Pay
    
    init(takeHomePay: Pay = .init(incomeType: .takeHome), grossPay: Pay = .init(incomeType: .gross)) {
        self.takeHomePay = takeHomePay
        self.grossPay = grossPay
    }
}
