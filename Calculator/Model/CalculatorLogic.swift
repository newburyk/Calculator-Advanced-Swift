//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Kevin Newbury on 2020-07-15.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

//guard let vs if let
//guard let: used in cases where a rare bug can crash the app
//if let: used in cases where some cases can be ignored


import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double?  {
        
        if let n = number {
//            if symbol == "+/-" {
//                return n * -1
//            } else if symbol == "AC" {
//                return 0
//            } else if symbol == "%" {
//                return n / 100
//            } else if symbol == "=" {
//                return performTwoNumberCalculation(n2: n)
//            } else {
//                intermediateCalculation = (n1: n, calcMethod: symbol)
//            }
            
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            
            }
        }
        
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            
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
                fatalError("Operation passed in doesn't match any case.")
            }
        }
        return nil
    }
    
}
