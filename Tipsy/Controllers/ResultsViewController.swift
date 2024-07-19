//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Grga Jovanovski on 19.07.2024..
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalPerPerson: Float?
    var totalSplit: Float?
    var totalTip: Float?
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsLabel.text = "Split between \(String(Int(totalSplit!))) people, with \(String(Int(totalTip! * 100)))% tip."
        
        totalLabel.text = String(format: "%.2f", totalPerPerson!)
        
        // Do any additional setup after loading the view.
    }
    
}
