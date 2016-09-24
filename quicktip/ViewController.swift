//
//  ViewController.swift
//  quicktip
//
//  Created by Marisha Schumacher-Hodge on 9/18/16.
//  Copyright © 2016 Marisha Schumacher-Hodge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipController: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var numberOfPeople: UISegmentedControl!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var totalName: UILabel!
    @IBOutlet weak var tipName: UILabel!
    
    let animated = true
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipController.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        var numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.currency
        numberFormatter.locale = NSLocale.current
        
        let tipPercentages = [0.18, 0.20, 0.22]
        let numPeople = [1, 2, 3, 4]
        let bill = Double(billField.text!) ?? 0
        var total = Double(0)
        let tip = Double((bill * tipPercentages[tipController.selectedSegmentIndex]))/Double(numPeople[numberOfPeople.selectedSegmentIndex])
        
        if numberOfPeople.selectedSegmentIndex != 0 {
            let splitNum = Double(bill) / Double(numPeople[numberOfPeople.selectedSegmentIndex])
            let splitNumNS =  numberFormatter.string(from: NSNumber(floatLiteral: splitNum))!
            splitLabel.text = String(splitNumNS)
            tipName.text = "Tip per person"
            totalName.text = "Total per person"

            total = splitNum + tip
        } else {
            splitLabel.text = ""
            tipName.text = "Tip"
            totalName.text = "Total"
            total = bill + tip
        }

        let tipNS = numberFormatter.string(from: NSNumber(floatLiteral: tip))!
        let totalNS = numberFormatter.string(from: NSNumber(floatLiteral: total))!
        
        tipLabel.text = String(tipNS)
        totalLabel.text = String(totalNS)
    }

}

