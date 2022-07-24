//
//  PersonnelViewController.swift
//  Enemy Losses
//
//  Created by Захар Кондратюк on 19.07.2022.
//

import UIKit

class PersonnelViewController: UIViewController {
    
    var pLosses: PersonnelLosses?

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var personnelLabel: UILabel!
    @IBOutlet weak var prisonerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayLabel.text = "День війни: \((pLosses?.day) ?? 0)"
        personnelLabel.text = "Особового складу: \((pLosses?.personnel) ?? 0)"
        prisonerLabel.text = "Військовополонених: \((pLosses?.prisoner) ?? 0)"
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
