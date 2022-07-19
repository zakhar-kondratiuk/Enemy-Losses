//
//  DateBrain.swift
//  Enemy Losses
//
//  Created by Захар Кондратюк on 10.07.2022.
//

import Foundation

struct DateCounter {
    
    func dateMax() -> Float {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let startDate = formatter.date(from: "24.02.2022")
        let endDate = Date.now
        let amountOfDays = Calendar.current.dateComponents([.day], from: startDate!, to: endDate)
        return Float(amountOfDays.day!)
    }
    
}
