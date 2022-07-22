//
//  ViewController.swift
//  Enemy Losses
//
//  Created by Захар Кондратюк on 06.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var dateCounter = DateCounter()
    var dateManager = DateManager()
    var lossesManager = LossesManager()
    var sliderValue = 0
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func segmentControlChanged(_ sender: UISegmentedControl) {
        //        if sender.selectedSegmentIndex == 0 {
        //        }
    }
    
    @IBAction func dateSliderChanged(_ sender: UISlider) {
        //        sender.maximumValue = dateCounter.dateMax()
        sender.maximumValue = 145
        sliderValue = Int(sender.value)
        dateLabel.text = dateManager.dateValue(value: sliderValue)
        print(sliderValue)
    }
    
    @IBAction func resultPressed(_ sender: UIButton) {
        //        self.performSegue(withIdentifier: "goToPersonnel", sender: self)
        //        lossesManager.performPersonnelRequest(itemValue: sliderValue)
        
        
        self.performSegue(withIdentifier: "goToEquipment", sender: self)
        lossesManager.performEquipmentRequest(itemValue: sliderValue)
        
        print("sliderValue: \(sliderValue)")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if identifier == "goToPersonnel" {
            let destinationVC = segue.destination as! PersonnelViewController
        }
        else if identifier == "goToEquipment" {
            let destinationVC = segue.destination as! EquipmentViewController
            destinationVC.eqDay = lossesManager.getEqDay()
        }
    }
    
}

