//
//  ViewController.swift
//  Enemy Losses
//
//  Created by Захар Кондратюк on 06.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var dateCounter = DateCounter()
    var lossesManager = LossesManager()
    var sliderValue = 0
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func personnelEquipmentControl(_ sender: UISegmentedControl) {
    }
    
    @IBAction func dateSliderChanged(_ sender: UISlider) {
        
//        вынести отделно
        
//        sender.maximumValue = dateCounter.dateMax()
        sliderValue = Int(sender.value)
        
        var component = DateComponents()
        component.day = sliderValue
        
        let сalendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let startDate = formatter.date(from: "25.02.2022")
        
        let nextDate = сalendar.date(byAdding: component, to: startDate!)
        let dateString = formatter.string(from: nextDate!)
        
        dateLabel.text = dateString
//        print(sliderValue)
    }
    
    @IBAction func resultPressed(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "goToPersonnel", sender: self)
//        lossesManager.performPersonnelRequest(itemValue: sliderValue)
        
        
        self.performSegue(withIdentifier: "goToEquipment", sender: self)
        lossesManager.performEquipmentRequest(itemValue: sliderValue)
        
        
        
        print("sliderValue: \(sliderValue)")
    }
    
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "goToResult" {
    //            let destinationVC = segue.destination as! ResultViewController
    //        }
    //    }
    
}

