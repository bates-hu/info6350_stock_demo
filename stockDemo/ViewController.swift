//
//  ViewController.swift
//  stockDemo
//
//  Created by 胡秉诚 on 10/29/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {
    
    let urlTemplate = "https://financialmodelingprep.com/api/v3/profile/%s?apikey=652bb44d1cc9fd9d1dc41cfbb3c481d5"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getBt(_ sender: Any) {
        if self.nameTxt.text == nil {
            return
        }
        let url = "https://financialmodelingprep.com/api/v3/profile/" + self.nameTxt.text! + "?apikey=652bb44d1cc9fd9d1dc41cfbb3c481d5"
        
        Alamofire.request(url).responseJSON {
            response in
            let json = JSON(response.result.value!)
            if json.count > 0 {
                self.ceoTxt.text = json[0]["ceo"].string
                self.priceTxt.text = String(json[0]["price"].float!)
            } else {
                self.ceoTxt.text = nil
                self.priceTxt.text = nil
            }
        }
        
    }
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var priceTxt: UITextField!
    @IBOutlet weak var ceoTxt: UITextField!
}

