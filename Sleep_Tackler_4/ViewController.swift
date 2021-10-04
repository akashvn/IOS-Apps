//
//  ViewController.swift
//  Sleep_Tackler_4
//
//  Created by Akash Vemulapalli on 11/9/20.
//  Copyright © 2020 Akash Vemulapalli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .orange;
        
        let now = Date()

        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium

        let datetime = formatter.string(from: now)
        currentTimeLabel.text = datetime
        print(datetime)
        
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            let now = Date()

            let formatter = DateFormatter()
            formatter.dateStyle = .none
            formatter.timeStyle = .medium

            let datetime = formatter.string(from: now)
            self.currentTimeLabel.text = datetime
            print(datetime)
        }
        //self.simpleLabel.text = datetime
    }
    
    @IBAction func didTapButtonOne() {
        guard let vc = storyboard?.instantiateViewController(identifier: "alarm_vc") as? TealViewController else {
            return
        }
        present(vc, animated: true)
    }
    
    
    @IBAction func didTapButtonTwo() {
        guard let vc = storyboard?.instantiateViewController(identifier: "plan_vc") as? GreenViewController else {
                   return
               }
        present(vc, animated: true)
    }
    
    @IBAction func didTapButtonThree() {
        guard let vc = storyboard?.instantiateViewController(identifier: "sleep_vc") as? PurpleViewController  else {
                   return
               }
        present(vc, animated: true)
    }

    @IBAction func didTapButtonFour() {
        guard let vc = storyboard?.instantiateViewController(identifier: "caf_vc") as? RedViewController  else {
                   return
               }
        present(vc, animated: true)
    }
    


}
