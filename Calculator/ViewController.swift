//
//  ViewController.swift
//  Calculator
//
//  Created by 江春辉 on 20/12/17.
//  Copyright © 2017年 JCH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var isInMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if (isInMiddleOfTyping) {
            let currentTextInDisplay = display.text!
            display.text = currentTextInDisplay + digit
        } else {
            display.text = digit
            isInMiddleOfTyping = true
        }
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        
        set {
            display.text = String(newValue)
        }
        
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        isInMiddleOfTyping = false
        if let mathematicSymbol = sender.currentTitle {
            switch mathematicSymbol {
            case "π":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
    }
}

