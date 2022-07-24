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
    
    
    func performEquipmentRequest(completion: @escaping (Result<[EquipmentLosses], Error>) -> ()) {
        if let url = URL(string: equipmentURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                } else if let safeData = data {
                    parseEquipment(equipmentData: safeData, completion: completion)
                }
            }
            task.resume()
        }
    }
    
    func parseEquipment(equipmentData: Data, completion: (Result<[EquipmentLosses], Error>) -> ()) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([EquipmentLosses].self, from: equipmentData)
            completion(.success(decodedData))
        } catch(let error) {
            completion(.failure(error))
        }
    }
    
    func performPersonnelRequest(competion: @escaping (Result<[PersonnelLosses], Error>) -> ()) {
        if let url = URL(string: personnelURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    competion(.failure(error))
                } else if let safeData = data {
                    parsePersonnel(personnelData: safeData, complition: competion)
                }
            }
            task.resume()
        }
    }
    
    func parsePersonnel(personnelData: Data, complition: (Result<[PersonnelLosses], Error>) -> ()) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([PersonnelLosses].self, from: personnelData)
            complition(.success(decodedData))
        } catch(let error) {
            complition(.failure(error))
        }
    }
    
}
