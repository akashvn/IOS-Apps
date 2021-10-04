//
//  RedViewController.swift
//  Sleep_Tackler_4
//
//  Created by Akash Vemulapalli on 11/13/20.
//  Copyright © 2020 Akash Vemulapalli. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    @IBOutlet weak var coffee_label: UILabel!
    
    @IBOutlet weak var tea_label: UILabel!
    
    @IBOutlet weak var energy_label: UILabel!
    
    @IBOutlet weak var soda_label: UILabel!
    
    @IBOutlet weak var chocolate_label: UILabel!
    @IBOutlet weak var main_text: UILabel!
    
    var coffee = 0.0
    var tea = 0.0
    var energy = 0.0
    var soda = 0.0
    var chocolate = 0.0
    var total = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            
            self.total = 85*self.coffee+32*self.tea+80*self.energy+20*self.chocolate+39*self.soda
            
            let a = "Your total caffeine intake today was "
            let b = String(self.total)
            let c = " mg. You are above the daily recommended maximum value by "
            let c2 = " mg. You are below the daily recommended maximum value by "
            let d = String(self.total-350)
            let d2 = String(350-self.total)
            let e = " mg"
            
            if self.total > 350 {
                self.main_text.text = a + b + c + d + e
            } else {
                self.main_text.text = a + b + c2 + d2 + e
            }
            
            
            
            
            //print(self.total)
        }
        
    }
    
    
    @IBAction func coffee_stepper(_ sender: UIStepper) {
        
        coffee_label.text = String(sender.value)
        coffee = sender.value
    }
    
    @IBAction func tea_stepper(_ sender: UIStepper) {
        
        tea_label.text = String(sender.value)
        tea = sender.value
    }
    
    
    @IBAction func chocolate_stepper(_ sender: UIStepper) {
        
        chocolate_label.text = String(sender.value)
        chocolate = sender.value
    }
    
    
    @IBAction func soda_stepper(_ sender: UIStepper) {
        
        soda_label.text = String(sender.value)
        soda = sender.value
    }
    
    
    @IBAction func energy_stepper(_ sender: UIStepper) {
        
        energy_label.text = String(sender.value)
        energy = sender.value
    }
    
    
}
