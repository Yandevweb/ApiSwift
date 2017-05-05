//
//  ViewController.swift
//  eval2
//
//  Created by stagiaire on 05/05/2017.
//  Copyright © 2017 IT-Akademy. All rights reserved.
//
// c8ee35350d419acb

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var location:String = "Lyon"
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request("https://api.wunderground.com/api/c8ee35350d419acb/conditions/q/FR/\(self.location).json").validate().responseJSON { (response:DataResponse<Any>) in
            if response.result.isSuccess {
                
                if let json = response.result.value as? [String:Any] {
                    
                    print("JSON: \(json)")
                    
                    let dataResult = json["current_observation"] as? [String:Any]
                    let display_location = dataResult?["display_location"] as? [String:Any]
                    let tempC:Int = dataResult?["temp_c"] as! Int!
                    let weather = dataResult?["weather"] as! String!
                    
                    self.cityLabel.text = display_location?["full"] as! String!
                    self.tempLabel.text = "Il fait : \(String(tempC)) C"
                    self.weatherLabel.text = weather
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

