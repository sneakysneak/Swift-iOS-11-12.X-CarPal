//
//  ViewController.swift
//  CarPal
//
//  Created by sneakysneak on 14/03/2019.
//  Copyright © 2019 sneakysneak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var vehicleTextField: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        
        let vehicleObject = UserDefaults.standard.object(forKey: "vehicles")
        
        var vehicles:[String]
        
        //[String] ???? how to define arraylist -.- NSMutablearray
        if let tempVehicles = vehicleObject as? [String] {
            
            vehicles = tempVehicles
            
            vehicles.append(vehicleTextField.text!)
            
        } else {
            
            vehicles = [vehicleTextField.text!]
        }
        // Save vehicles
        UserDefaults.standard.set(vehicles, forKey: "vehicles")
        // Reset the vehicle text field
        vehicleTextField.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    // Set up keyboard to disappear when click on somewhere else
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    // Set up keyboard to disappear when clicking on return DOESN:T WORK!!!!!!!!!!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    // Segue is the button between the viewcontrollers, so from 1st screen goes to Map screen if...
    // We can pass a new value to the Map vc username variable
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toMapViewController" {
            
            let viewController = segue
        }
    }
}

