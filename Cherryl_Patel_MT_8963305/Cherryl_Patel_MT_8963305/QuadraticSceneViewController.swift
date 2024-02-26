//
//  QuadraticSceneViewController.swift
//  Cherryl_Patel_MT_8963305
//
//  Created by user238103 on 2/25/24.
//

import UIKit

class QuadraticSceneViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var valueOfA: UITextField!
    
    @IBOutlet weak var valueOfB: UITextField!
    
    @IBOutlet weak var valueOfC: UITextField!
    
    @IBOutlet weak var displayMessage: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        valueOfA.delegate = self
        valueOfB.delegate = self
        valueOfC.delegate = self
        addDoneButtonToNumberPad()
        
        // dismiss the keyboard
        let tapOutSide = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tapOutSide)
    }
    
    // use to dismiss keyboard
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    // dismiss the keyboard on done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        valueOfA.resignFirstResponder()
        valueOfB.resignFirstResponder()
        valueOfC.resignFirstResponder()
        return true
    }
    
    
    @IBAction func calculateButton(_ sender: Any) {
        
        displayMessage.text = ""
            
            guard let aValue = Double(valueOfA.text?.trimmingCharacters(in: .whitespaces) ?? ""),
                  let bValue = Double(valueOfB.text?.trimmingCharacters(in: .whitespaces) ?? ""),
                  let cValue = Double(valueOfC.text?.trimmingCharacters(in: .whitespaces) ?? "") else {
                
                      displayMessage.textColor = .red
                      if valueOfA.text?.isEmpty ?? true && valueOfB.text?.isEmpty ?? true && valueOfC.text?.isEmpty ?? true {
                          
                          displayMessage.text = "Enter value for A, B and C to find X."
                          
                      } else {
                          
                          if Double(valueOfA.text?.trimmingCharacters(in: .whitespaces) ?? "") == nil {
                              
                              displayMessage.text += "The value you entered for A is invalid.\n"
                          }
                          if Double(valueOfB.text?.trimmingCharacters(in: .whitespaces) ?? "") == nil {
                              
                              displayMessage.text += "The value you entered for B is invalid.\n"
                          }
                          if Double(valueOfC.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "") == nil {
                              
                              displayMessage.text += "The value you entered for C is invalid."
                          }
                      }
                      return
            }
            
            if aValue == 0 {
                
                displayMessage.textColor = .red
                displayMessage.text = "The value you entered for A is invalid."
                return
            }
            
            let discriminant = bValue * bValue - 4 * aValue * cValue
            
            if discriminant == 0 {
                
                let x = -bValue / (2 * aValue)
                
                displayMessage.textColor = .black
                displayMessage.text = "There is only one value for X \nValue of X = \(String(format: "%.2f", x))"
                
            } else if discriminant > 0 {
                
                let x1 = (-bValue + sqrt(discriminant)) / (2 * aValue)
                let x2 = (-bValue - sqrt(discriminant)) / (2 * aValue)
                
                displayMessage.textColor = .black
                displayMessage.text = "There are two values for X \n1st value of x = \(String(format: "%.2f", x1)) \n2nd value of x = \(String(format: "%.2f", x2))"
                
            } else {
                
                displayMessage.textColor = .black
                displayMessage.text = "There are no results since the discriminant is less than zero."
            }
        
    }
    
    
    @IBAction func clearButton(_ sender: Any) {
        
        valueOfA.text = ""
        valueOfB.text = ""
        valueOfC.text = ""
        
        displayMessage.text = "Enter value for A, B and C to find X."
        
    }
    
    // add "Done" button to the number pad keyboard
    func addDoneButtonToNumberPad() {

           let toolbar = UIToolbar()
           toolbar.sizeToFit()

           let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
           toolbar.items = [doneButton]

            // Assign the toolbar to the ageTextField
            valueOfA.inputAccessoryView = toolbar
            valueOfB.inputAccessoryView = toolbar
            valueOfC.inputAccessoryView = toolbar

       }

    // on TAP "Done" button
    @objc func doneButtonTapped() {

        valueOfA.resignFirstResponder()
        valueOfB.resignFirstResponder()
        valueOfC.resignFirstResponder()
    }
    
}
