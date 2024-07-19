//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Grga Jovanovski on 19.07.2024..
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var tipAmount: Float = 0.0
    var splitAmount: Float = 2.0
    var billAmount: Float = 0.0
    
    func getTotalTip() -> Float {
        return ((billAmount + (billAmount * tipAmount)) / splitAmount)
    }
}
