//
//  ViewController.swift
//  EggTimer
//
//  Created by alsmh ahmed on 28/11/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var secondPassed = 0
    var totalTime = 0
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
                
        timer.invalidate()
        let hardness = sender.currentTitle! //Soft, Medium, Hard
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
            
    }
    
    @objc func updateTimer(){
        if secondPassed < totalTime {
            secondPassed += 1
            progressBar.progress = Float(secondPassed) / Float(totalTime)
            print(Float(secondPassed) / Float(totalTime))
            
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    
}
