//
//  HourlyInput.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import Foundation

struct HourlyInput {
    var hourlyImage: Double?
    var hoursPerWeek: Double?
    var takeHomePercentage: Double?
    var overtime:Bool
    
    init(hourlyImage:Double? = nil, hoursPerWeek:Double? = nil, takeHomePercentage:Double? = nil, overtime:Bool = true){
        self.hourlyImage = hourlyImage
        self.hoursPerWeek = hoursPerWeek
        self.takeHomePercentage = takeHomePercentage
        self.overtime = overtime
    }
    
    let hoursPerWeekLimitOvertime:Double = 40
}
