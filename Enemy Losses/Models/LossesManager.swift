//
//  LossesManager.swift
//  Enemy Losses
//
//  Created by Захар Кондратюк on 13.07.2022.
//

import Foundation

struct LossesManager {
    let equipmentURL = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json"
    let personnelURL = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json"
    
    let equipmentLosses = EquipmentLosses()
    
    func getEqDay() -> String {
        let eqDay = String(equipmentLosses.day)
        return eqDay
    }
    
//    в строках 14 и 16-19 я пытаюсь получить значения day, aircraft и т.д., чтобы отобразить их через EquipmentViewController, но пока что не могу разобравться, как это сделать
    
    
//    var eqDay: Int?
//    var eqAircraft: Int?
//
//    var perDay: Int
//    var perPersonnel: Int
//    var perPrisoner: Int
    
    
    //Equipment Request
    func performEquipmentRequest(itemValue: Int) {
        if let url = URL(string: equipmentURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    let stringData = String(data: safeData, encoding: .utf8)!
                    let filteredString = stringData.replacingOccurrences(of: "NaN", with: "NaN")
                    let filteredData = filteredString.data(using: .utf8)
                    
                    parseEquipment(equipmentData: filteredData!, item: itemValue)
                }
            }
            task.resume()
        }
    }
    
    func parseEquipment(equipmentData: Data, item: Int) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([EquipmentLosses].self, from: equipmentData)
            print("День війни: \(decodedData[item].day!)")
            print("Літаків: \(decodedData[item].aircraft!)")
            print("Гелікоптерів: \(decodedData[item].helicopter!)")
            print("Танків: \(decodedData[item].tank!)")
            print("Бронеавтомобілів: \(decodedData[item].apc!)")
            print("Артилерія: \(decodedData[item].fieldArtillery!)")
            print("РСЗВ: \(decodedData[item].mrl!)")
            print("Автомобілів: \(decodedData[item].militaryAuto!)")
            print("Цистерн з паливом: \(decodedData[item].fuelTank!)")
            print("Дронів: \(decodedData[item].drone!)")
        } catch {
            print(error)
        }
        
    }
    
    //Personnel Request
    func performPersonnelRequest(itemValue: Int) {
        if let url = URL(string: personnelURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    parsePersonnel(arrayOfData: safeData, item: itemValue)
                }
            }
            task.resume()
        }
    }
    
    func parsePersonnel(arrayOfData: Data, item: Int) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([PersonnelLosses].self, from: arrayOfData)
            
//            perDay = decodedData[item].day
//            perPersonnel = decodedData[item].personnel
//            perPrisoner = decodedData[item].prisoner!
            let day = decodedData[item].day
            let personnel = decodedData[item].personnel
            let prisoner = decodedData[item].prisoner
            print("День війни: \(day)")
            print("Втрати особового складу: \(personnel)")
            print("Кількість військовополонених: \(prisoner)")
            
        } catch {
            print(error)
        }
    }
    
}
