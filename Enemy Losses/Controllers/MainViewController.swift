//
//  ViewController.swift
//  Enemy Losses
//
//  Created by Захар Кондратюк on 06.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let dateService = DateService()
    let lossesManager = LossesManager()
    var personnelLosses: [PersonnelLosses] = []
    var equipmentLosses: [EquipmentLosses] = []
    let personnelIdentifier = "goToPersonnel"
    let equipmentIdentifier = "goToEquipment"
    var selectedDate = ""
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func dateSliderChanged(_ sender: UISlider) {
        sender.maximumValue = Float(dateService.dateMax())
        let sliderValue = Int(sender.value)
        let date = dateService.dateValue(value: sliderValue)
        dateLabel.text = date
        selectedDate = dateService.transform(date: date, to: "yyyy-MM-dd")
    }
    
    @IBAction func resultPressed(_ sender: UIButton) {
        if segmentedControl.selectedSegmentIndex == 0 {
            requestAndShowPersonelLosses()
        } else if segmentedControl.selectedSegmentIndex == 1 {
            requestAndShowEquipmentLosses()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if identifier == personnelIdentifier {
            let filteredLosses = personnelLosses.filter { $0.date == selectedDate }
            let destinationVC = segue.destination as! PersonnelViewController
            destinationVC.pLosses = filteredLosses.first
        } else if identifier == equipmentIdentifier {
            let filteredLosses = equipmentLosses.filter { $0.date == selectedDate }
            let destinationVC = segue.destination as! EquipmentViewController
            destinationVC.eqLosses = filteredLosses.first
        }
    }
    
    func requestAndShowPersonelLosses() {
        lossesManager.performPersonnelRequest { result in
            switch result {
            case .success(let losses):
                self.personnelLosses = losses
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: self.personnelIdentifier, sender: self)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func requestAndShowEquipmentLosses() {
        lossesManager.performEquipmentRequest { result in
            switch result {
            case .success(let losses):
                self.equipmentLosses = losses
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: self.equipmentIdentifier, sender: self)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

