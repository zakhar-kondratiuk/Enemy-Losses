//
//  LossesData.swift
//  Enemy Losses
//
//  Created by Захар Кондратюк on 14.07.2022.
//

import Foundation

struct EquipmentLosses: Decodable {
//    let date: Date?
    var day: Int?
    let aircraft: Int?
    let helicopter: Int?
    let tank: Int?
    let apc: Int?
    let fieldArtillery: Int?
    let mrl: Int?
    let militaryAuto: Int?
    let fuelTank: Int?
    let vehiclesAndFuelTanks: Int?
    let drone: Int?
    let navalShip: Int?
    let antiAircraftWarfare: Int?
    let specialEquipment: Int?
    let mobileSRBMsystem: Int?
    let cruiseMissiles: Int?
    let greatestLossesDirection: String?
    
    enum CodingKeys: String, CodingKey {
        case day
        case aircraft, helicopter, tank, drone
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMsystem = "mobile SRBM system"
        case cruiseMissiles = "cruise missiles"
        case greatestLossesDirection = "greatest losses direction"
    }
}



struct PersonnelLosses: Decodable {
    let day: Int
    let personnel: Int
    let prisoner: Int?
    
    enum CodingKeys: String, CodingKey {
        case day, personnel
        case prisoner = "POW"
    }
}

extension EquipmentLosses: Encodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            if let int = try? values.decode(Int.self, forKey: .day) {
                day = int
            }
            else if let str = try? values.decode(String.self, forKey: .day){
                    day = Int(str)
            }
            aircraft = try? values.decode(Int.self, forKey: .aircraft)
            helicopter = try? values.decode(Int.self, forKey: .helicopter)
            tank = try? values.decode(Int.self, forKey: .tank)
            apc = try? values.decode(Int.self, forKey: .apc)
            fieldArtillery = try? values.decode(Int.self, forKey: .fieldArtillery)
            mrl = try? values.decode(Int.self, forKey: .mrl)
            militaryAuto = try? values.decode(Int.self, forKey: .militaryAuto)
            fuelTank = try? values.decode(Int.self, forKey: .fuelTank)
            vehiclesAndFuelTanks = try? values.decode(Int.self, forKey: .vehiclesAndFuelTanks)
            drone = try? values.decode(Int.self, forKey: .drone)
            navalShip = try? values.decode(Int.self, forKey: .navalShip)
            antiAircraftWarfare = try? values.decode(Int.self, forKey: .antiAircraftWarfare)
            specialEquipment = try? values.decode(Int.self, forKey: .specialEquipment)
            mobileSRBMsystem = try? values.decode(Int.self, forKey: .mobileSRBMsystem)
            cruiseMissiles = try? values.decode(Int.self, forKey: .cruiseMissiles)
            greatestLossesDirection = try? values.decode(String.self, forKey: .greatestLossesDirection)
        } catch(let error) {
            print(error)
        }
    }

}
