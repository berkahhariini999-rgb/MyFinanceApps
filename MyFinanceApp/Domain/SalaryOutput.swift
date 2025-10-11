//
//  SalaryOutput.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import Foundation

struct SalaryOutput {
    let hourlyImage: Double
    let takeHomePay: Pay
    let grossPay: Pay
    
    init(hourlyImage: Double = 0.0 , takeHomePay: Pay = .init(incomeType: .takeHome), grossPay: Pay = .init(incomeType: .gross)) {
        self.hourlyImage = hourlyImage
        self.takeHomePay = takeHomePay
        self.grossPay = grossPay
    }
}
