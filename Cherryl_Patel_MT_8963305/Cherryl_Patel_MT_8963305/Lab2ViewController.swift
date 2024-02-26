//
//  Lab2ViewController.swift
//  Cherryl_Patel_MT_8963305
//
//  Created by user238103 on 2/25/24.
//

import UIKit

class Lab2ViewController: UIViewController {

    var count: Int = 0
    var stepCount: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBOutlet weak var displayLable: UILabel!
    
    @IBAction func onTapMinusButton(_ sender: Any) {
        
        count = count - stepCount
        displayLable.text=String(count)
    }
    
    @IBAction func onTapPlusButton(_ sender: Any) {
        
        count = count + stepCount
        displayLable.text=String(count)
    }
    
    @IBAction func onTapStepButton(_ sender: Any) {
        
        stepCount = 2
    }
    
    @IBAction func onTapResetButton(_ sender: Any) {
        
        stepCount = 1
        count = 0
        displayLable.text=String(count)
        
    }
    
}
