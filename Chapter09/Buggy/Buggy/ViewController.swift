//
//  ViewController.swift
//  Buggy
//
//  Created by Eric Hyche on 8/24/19.
//  Copyright © 2019 Eric Hyche. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


//    @IBAction func buttonTapped(_ sender: Any) {
//    @IBAction func switchToggled(_ sender: UISwitch) {
//    @IBAction func buttonTapped(_ sender: UISwitch) {
    @IBAction func buttonTapped(_ sender: UIButton) {
//        print("buttonTapped was called")
//        // Log the control state:
//        print("Is control on? \(sender.isOn)")
        print("Method: \(#function) in file: \(#file) line: \(#line) called.")
        
        badMethod()
    }
    
    func badMethod() {
        let array = NSMutableArray()

        for i in 0..<10 {
            array.insert(i, at: i)
        }

        // Go one step too far emptying the array (notice the range change):
        for _ in 0...10 {
            array.removeObject(at: 0)
        }
    }
    
}

