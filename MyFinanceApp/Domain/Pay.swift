//
//  Pay.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import Foundation

struct Pay {
    let incomeType: IncomeType
    let weekly: Double
    let biWeekly: Double
    let fourWeekly: Double
    let monthly: Double
    let yearly: Double
    
    init(incomeType: IncomeType = .gross, weekly: Double = 0.0, biWeekly: Double = 0.0, fourWeekly: Double = 0.0, monthly: Double = 0.0, yearly: Double = 0.0) {
        self.incomeType = incomeType
        self.weekly = weekly
        self.biWeekly = biWeekly
        self.fourWeekly = fourWeekly
        self.monthly = monthly
        self.yearly = yearly
    }
    
}


extension Pay {
    enum IncomeType {
        case gross
        case takeHome
    }
    
    var description:String {
        switch incomeType {
        case .gross: "Gross"
        case .takeHome: "Take Home"
        }
     }
}

extension Pay {
    var breakdown: [(name: String, value: Double)]{
        [
            ("Weekly", weekly),
            ("Bi-Weekly", biWeekly),
            ("4-Weekly", fourWeekly),
            ("Monthly", monthly),
            ("Yearly", yearly)
        ]
    }
}
