//
//  ViewController.swift
//  Calculator
//


import UIKit

class ViewController: UIViewController {
       
    @IBOutlet weak var displayLabel: UILabel!
    private var  isFinishedTypingNumber : Bool = true
    private var displayValue : Double {
        get {
            guard let number = Double(displayLabel.text!) else{
                fatalError("can not convert display label text to double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
        
    }
    
  private  var caculator = CalculationLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        if let calcMethod = sender.currentTitle{
            caculator.setNumber(displayValue)
            if let result = caculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
            
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let newValue = sender.currentTitle{
            if isFinishedTypingNumber {
                displayLabel.text = newValue
                isFinishedTypingNumber = false
            }else{
                if newValue == "."{
                    
                    let isInt = floor(displayValue) == displayValue
                    if !isInt{
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + newValue
            }
            
            
            
        }
    
    }

}

