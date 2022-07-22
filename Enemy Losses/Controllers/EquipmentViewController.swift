//
//  ResultViewController.swift
//  Enemy Losses
//
//  Created by Захар Кондратюк on 11.07.2022.
//

import UIKit

class EquipmentViewController: UIViewController {
    
    var dateValue: String?
    var eqDay: String?

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
