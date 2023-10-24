//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Nikita gupta on 19/09/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit
struct CalculatorBrain{
    var bmi: BMI?
    
    func getBMIValue()->String{
        let bmiTo1Decimal = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1Decimal
    }
    func getAdvice()->String{
        return bmi?.advice ?? "No Advice"
    }
    func getColor()->UIColor{
        return bmi?.color ?? UIColor.white
    }
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight/pow(height, 2)
        if(bmiValue<18.5){
            bmi  = BMI(value: bmiValue, advice: "Eat more snacks", color: UIColor.blue )
        }else if(bmiValue<24.9){
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: UIColor.green)
        }else{
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: UIColor.red)
        }
    }
}
