//
//  DateBrain.swift
//  Enemy Losses
//
//  Created by Захар Кондратюк on 10.07.2022.
//

import Foundation

struct DateService {
    
    let dateFormat = "dd.MM.yyyy"
    let startDate = "25.02.2022"
    
    func dateMax() -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        if let startDate = formatter.date(from: startDate) {
            let endDate = Date.now
            let amountOfDays = Calendar.current.dateComponents([.day], from: startDate, to: endDate)
            return amountOfDays.day ?? 0
        }
        return 0
    }
    
    func dateValue(value: Int) -> String {
        var component = DateComponents()
        let sliderValue = value
        component.day = sliderValue
        
        let сalendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let startDate = formatter.date(from: startDate)
        let nextDate = сalendar.date(byAdding: component, to: startDate!)
        let dateString = formatter.string(from: nextDate!)
        return dateString
    }
    
    func transform(date: String, to format: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = dateFormat
        let showDate = inputFormatter.date(from: date) ?? Date()
        inputFormatter.dateFormat = format
        return inputFormatter.string(from: showDate)
    }
}

