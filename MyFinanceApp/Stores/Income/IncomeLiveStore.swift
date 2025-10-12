//
//  IncomeLiveStore.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import Foundation

final class IncomeLiveStore: IncomeStore {
    func getSalaryOutput(for salaryInput: SalaryInput) -> SalaryOutput {
        calculateSalaryOutput(for: <#T##SalaryInput#>)
    }
    
    func getHourlyOutput(for hourlyInput: HourlyInput) -> HourlyOutput {
        calculateHourlyOutput(for: hourlyInput)
    }
}

private extension IncomeLiveStore {
    func calculateSalaryOutput(for salaryInput: SalaryInput) -> SalaryOutput {
        guard let yearlyGrossPay = salaryInput.yearlyGross else {
            return .init()
        }
        let weeksInYear: Double = 52
        let monthsInYear: Double = 12
        let hoursPerWeek: Double = 40
        
        let weeklyGrossPay: Double = yearlyGrossPay / weeksInYear
        let biWeeklyGrossPay: Double = weeklyGrossPay * 2
        let fourWeeksGrossPay: Double = weeklyGrossPay * 4
        let monthlyGrossPay: Double = yearlyGrossPay / monthsInYear
        
        let hourlyImage: Double = weeklyGrossPay / hoursPerWeek
        
        let takeHomePercentageDefaultValue: Double = 83.00
        
        let takeHomePercentage = salaryInput.takeHomePercentage ?? takeHomePercentageDefaultValue
        
        let takeHomeMultiplier = takeHomePercentage / 100
        
        return .init(
            hourlyImage: hourlyImage,
            takeHomePay: .init(
                incomeType: .takeHome,
                weekly: weeklyGrossPay * takeHomeMultiplier,
                biWeekly: biWeeklyGrossPay * takeHomeMultiplier,
                fourWeekly: fourWeeksGrossPay * takeHomeMultiplier,
                monthly: monthlyGrossPay * takeHomeMultiplier,
                yearly: yearlyGrossPay * takeHomeMultiplier
            ),
            grossPay: .init(
                incomeType: .gross,
                weekly: weeklyGrossPay,
                biWeekly: biWeeklyGrossPay,
                fourWeekly: fourWeeksGrossPay,
                monthly: monthlyGrossPay,
                yearly: yearlyGrossPay
            )
       )
    }
    
    func calculateHourlyOutput(for hourlyInput: HourlyInput) -> HourlyOutput {
        guard let hourlyImage = hourlyInput.hourlyImage,
              let hoursPerWeek = hourlyInput.hoursPerWeek
        else {
            return .init()
        }
        
        
        let weeksInYear: Double = 52
        let monthsInYear: Double = 12
        let hoursPerWeekLimitOvertime: Double = 40
        let overtimeRate: Double = 1.5
        
        let regularHours = min(hoursPerWeek, hoursPerWeekLimitOvertime)
        let overtimeHours = max(0, hoursPerWeek - hoursPerWeekLimitOvertime)
        
        let overtimeHourlyImage = hourlyImage * overtimeRate
        let shouldCalculateOvertime: Bool = (overtimeHours > 0 && hourlyInput.overtime)
        
        let weeklyGrossPay: Double = shouldCalculateOvertime ?
        (regularHours * hourlyImage) + (overtimeHours * overtimeHourlyImage) :
        (hoursPerWeek * hourlyImage)
        
        let biweeklyGrossPay = weeklyGrossPay * 2
        let fourWeeklyGrossPay = weeklyGrossPay * 4
        
        let yearlyGrossPay = weeklyGrossPay * weeksInYear
        let monthlyGrossPay = yearlyGrossPay / monthsInYear
        
        let takeHomePercentageDefaultValue: Double = 83.00
        let takeHomePercentage = hourlyInput.takeHomePercentage ??
        takeHomePercentageDefaultValue
        let takeHomeMultiplier = takeHomePercentage / 100
        
        return .init(
            takeHomePay: .init(
                incomeType: .takeHome,
                weekly: weeklyGrossPay * takeHomeMultiplier,
                biWeekly: biweeklyGrossPay * takeHomeMultiplier,
                fourWeekly: fourWeeklyGrossPay * takeHomeMultiplier,
                monthly: monthlyGrossPay * takeHomeMultiplier,
                yearly: yearlyGrossPay * takeHomeMultiplier
                
            ),
            
            grossPay: .init(
                incomeType: .gross,
                weekly: weeklyGrossPay,
                biWeekly: biweeklyGrossPay,
                fourWeekly: fourWeeklyGrossPay,
                monthly: monthlyGrossPay,
                yearly: yearlyGrossPay
            )
            
        )
        
    }

    
}
