//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

var calculatorBrain = CalculatorBrain()

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        
        sender.isSelected = true
        
        billTextField.endEditing(true)
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        calculatorBrain.splitAmount = Float(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if zeroPercentButton.isSelected == true {
            calculatorBrain.tipAmount = 0
        } else if tenPercentButton.isSelected == true {
            calculatorBrain.tipAmount = 0.1
        } else {
            calculatorBrain.tipAmount = 0.2
        }
        let bill = billTextField.text!
        if bill != "" {
            calculatorBrain.billAmount = Float(bill) ?? 0.0
        }
        
        print()
        
        self.performSegue(withIdentifier: "getResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalPerPerson = calculatorBrain.getTotalTip()
            destinationVC.totalSplit = calculatorBrain.splitAmount
            destinationVC.totalTip = calculatorBrain.tipAmount
        }
    }
    
    
}

