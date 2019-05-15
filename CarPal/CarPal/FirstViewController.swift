//
//  FirstViewController.swift
//  CarPal
//
//  Created by sneakysneak on 15/03/2019.
//  Copyright © 2019 sneakysneak. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var activeRow = 0
    
    var vehicleLocation = "jaj"
    
    // Define array here as an empty array
    
    @IBOutlet var table: UITableView!
    
    var vehicles:[String] = []
    
    @available(iOS 2.0, *)
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return vehicles.count
    }
    
    @available(iOS 2.0, *)
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = vehicles[indexPath.row]
        
        return cell
 
//        var cellLabel = ""
//
//        if let tempLabel = vehicles[indexPath.row] as? String {
//
//            cellLabel = tempLabel
//        }
        
        // The number in the vehicles array what must grab - convert to String as well
        
//        cell.textLabel?.text = cellLabel
        
//        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        activeRow = indexPath.row
        
        performSegue(withIdentifier: "toMapViewController", sender: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    //Refresh table after added elements
    
    override func viewDidAppear(_ animated: Bool) {
        
        let vehiclesObject = UserDefaults.standard.object(forKey: "vehicles")
        
        if let tempVehicles = vehiclesObject as? [String] {
            
            vehicles = tempVehicles
            
        }
        
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            vehicles.remove(at: indexPath.row)
            
            table.reloadData()
            
            UserDefaults.standard.set(vehicles, forKey: "vehicles")
        }
    }
    
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toMapViewController" {
            
            let MapViewController = segue.destination as! MapViewController
            
            MapViewController.activeRow = activeRow
        }
    }


}
