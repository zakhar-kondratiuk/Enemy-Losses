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
    
//Equipment Request
    func performEquipmentRequest(itemValue: Int) {
        if let url = URL(string: equipmentURL) {
            let session = URLSession(configuration: .default)
            let task    = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
//                    let dataString = String(data: safeData, encoding: .utf8)
//                    print(dataString!)
                    parseEquipment(equipmentData: safeData, item: itemValue)
                }
            }
            task.resume()
        }
    }
    
    func parseEquipment(equipmentData: Data, item: Int) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([EquipmentLosses].self, from: equipmentData)
            print(decodedData[item].day!)
        } catch {
            print(error)
        }
        
    }
    
//Personnel Request
    func performPersonnelRequest(itemValue: Int) {
        if let url = URL(string: personnelURL) {
            let session = URLSession(configuration: .default)
            let task    = session.dataTask(with: url) { data, response, error in
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
            
            let day         = decodedData[item].day
            let personnel   = decodedData[item].personnel
            let prisoner    = decodedData[item].prisoner
            print("День війни: \(day)")
            print("Втрати особового складу: \(personnel)")
            print("Кількість військовополонених: \(prisoner)")
            
        } catch {
            print(error)
        }
    }
    
}
