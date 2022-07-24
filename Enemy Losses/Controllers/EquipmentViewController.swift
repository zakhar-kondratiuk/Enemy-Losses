//
//  ResultViewController.swift
//  Enemy Losses
//
//  Created by Захар Кондратюк on 11.07.2022.
//

import UIKit

class EquipmentViewController: UIViewController {
    
    var eqLosses: EquipmentLosses?
    

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var aircraftLabel: UILabel!
    @IBOutlet weak var helicopterLabel: UILabel!
    @IBOutlet weak var tankLabel: UILabel!
    @IBOutlet weak var apcLabel: UILabel!
    @IBOutlet weak var fieldArtilleryLabel: UILabel!
    @IBOutlet weak var mrlLabel: UILabel!
    @IBOutlet weak var militaryAutoLabel: UILabel!
    @IBOutlet weak var fuelTankLabel: UILabel!
    @IBOutlet weak var vehiclesAndFuelTanksLabel: UILabel!
    @IBOutlet weak var droneLabel: UILabel!
    @IBOutlet weak var navalShipLabel: UILabel!
    @IBOutlet weak var antiAircraftWarfareLabel: UILabel!
    @IBOutlet weak var specialEquipmentLabel: UILabel!
    @IBOutlet weak var mobileSRBMsystemLabel: UILabel!
    @IBOutlet weak var cruiseMissilesLabel: UILabel!
    @IBOutlet weak var greatestLossesDirectionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayLabel.text = "День війни: \((eqLosses?.day) ?? 0)"
        aircraftLabel.text = "Літаків: \((eqLosses?.aircraft) ?? 0)"
        helicopterLabel.text = "Гелікоптерів: \((eqLosses?.helicopter) ?? 0)"
        tankLabel.text = "Танків: \((eqLosses?.tank) ?? 0)"
        apcLabel.text = "ББМ: \((eqLosses?.apc) ?? 0)"
        fieldArtilleryLabel.text = "Артилерійских систем: \((eqLosses?.fieldArtillery) ?? 0)"
        mrlLabel.text = "РСЗВ: \((eqLosses?.mrl) ?? 0)"
        militaryAutoLabel.text = "Автомобільна техніка: \((eqLosses?.militaryAuto) ?? 0)"
        fuelTankLabel.text = "Цистерн з ПММ: \((eqLosses?.fuelTank) ?? 0)"
        vehiclesAndFuelTanksLabel.text = "Автомобів та цистерн з ПММ: \((eqLosses?.vehiclesAndFuelTanks) ?? 0)"
        droneLabel.text = "БПЛА: \((eqLosses?.drone)!)"
        navalShipLabel.text = "Кораблів / катерів: \((eqLosses?.navalShip)!)"
        antiAircraftWarfareLabel.text = "Засобів ППО: \((eqLosses?.antiAircraftWarfare) ?? 0)"
        specialEquipmentLabel.text = "Спеціальної техніки: \((eqLosses?.specialEquipment) ?? 0)"
        mobileSRBMsystemLabel.text = "ПУ ОТРК / ТРК: \((eqLosses?.mobileSRBMsystem) ?? 0)"
        cruiseMissilesLabel.text = "Крилатих ракет: \((eqLosses?.cruiseMissiles) ?? 0)"
        greatestLossesDirectionLabel.text = "Найбільші втрати: \((eqLosses?.greatestLossesDirection) ?? "Дані відсутні")"
        
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
