//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import AVFoundation

class CalculateViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    var bmiValue = "0.0"
    var calculatorBrain = CalculatorBrain()
    @IBOutlet weak var wSlider: UISlider!
    @IBOutlet weak var hSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f",sender.value)+"m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightLabel.text = String(format: "%.2f",sender.value)+"Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = hSlider.value
        let weight = wSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)

        let url = Bundle.main.url(forResource: "bmiSound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

