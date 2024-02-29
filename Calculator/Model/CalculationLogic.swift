//
//  CalculationLogic.swift
//  Calculator
//
//  Created by elsayed mansour mahfouz on 2/11/24.

//

import Foundation
struct CalculationLogic {
    
    private var number : Double?
    private var intermidiateCalculation : (n1 : Double , calcMethod : String)?
    mutating func setNumber( _ number : Double){
        self.number = number
    }
    
    mutating func calculate(symbol : String) -> Double?{
   
        if let n = number{
            switch symbol {
            case "+/-":
                return n * -1
            case "AC" :
                return 0
            case "%" :
                return n / 100
            case "=" :
                return performTwoNumCalculation(n2: n)
            default:
                intermidiateCalculation = (n1 : n , calcMethod : symbol)
            }
            
        }
        return nil
        
    }
    
    private func performTwoNumCalculation(n2 : Double) -> Double?{
        
        if let n1 = intermidiateCalculation?.n1 ,
            let operation = intermidiateCalculation?.calcMethod{
            switch operation {
            case "+":
                return n1 + n2   
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("the operation does not match any of th cases")
            }
            }
        return nil
            
        }
        
    }
    

