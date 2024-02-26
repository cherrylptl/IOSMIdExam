//
//  CanadianCitiesViewController.swift
//  Cherryl_Patel_MT_8963305
//
//  Created by user238103 on 2/25/24.
//

import UIKit

class CanadianCitiesViewController: UIViewController ,UITextFieldDelegate {

    @IBOutlet weak var CityImage: UIImageView!
    
    @IBOutlet weak var CityNameTextField: UITextField!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    //List of cities
    var canadaCities = ["Calgary","Halifax","Montreal","Toronto","Vancouver","Winnipeg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CityImage.image = UIImage(named: "Canada")
        
        CityNameTextField.delegate = self
        
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
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func FindMyCityButton(_ sender: Any) {
        
        if(CityNameTextField.text != nil && canadaCities.contains(CityNameTextField.text!.capitalized.trimmingCharacters(in: .whitespaces))){
            
            ErrorLabel.text = ""
            CityImage.image = UIImage(named: CityNameTextField.text!.capitalized.trimmingCharacters(in: .whitespaces))
            
        }
        else if(CityNameTextField.text!.isEmpty){
            
            ErrorLabel.text = "Please enter city name"
        }
        else{
            
            ErrorLabel.text = "City not found or invalid input"
        }
        
    }

}
