//
//  SalaryInput.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import Foundation

struct SalaryInput {
    var yearlyGross: Double?
    var takeHomePercentage: Double?
    
    init(yearlyGross: Double? = nil, takeHomePercentage: Double? = nil) {
        self.yearlyGross = yearlyGross
        self.takeHomePercentage = takeHomePercentage
    }
    
}
