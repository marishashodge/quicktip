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
    @IBOutlet weak var numberOfPeople: UISegmentedControl!
    @IBOutlet weak var tipEquation: UITextField!
    @IBOutlet weak var equalSignLabel: UITextField!
    @IBOutlet weak var plusField: UITextField!
    @IBOutlet weak var totalField: UITextField!
    let animated = true
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipController.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.blue
        //self.billField?.borderStyle = UITextBorderStyle.roundedRect
        billField?.placeholder = "$"
        billField?.becomeFirstResponder()
        billField?.font = UIFont(name: "Helvetica Neue", size: 50)
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

            total = splitNum + tip
        } else {
            total = bill + tip
        }

        let tipNS = numberFormatter.string(from: NSNumber(floatLiteral: tip))!
        let totalNS = numberFormatter.string(from: NSNumber(floatLiteral: total))!
        
        //tipLabel.text = String(tipNS)
        //totalLabel.text = String(totalNS)
        plusField?.text = " + "
        plusField?.font = UIFont(name: "Helvetica Neue", size: 35)
        
        tipEquation.text = String(tipNS)
        tipEquation?.font = UIFont(name: "Helvetica Neue", size: 35)
        equalSignLabel?.text = " = "
        equalSignLabel?.font = UIFont(name: "Helvetica Neue", size: 35)
        
        totalField.text = String(totalNS)
        totalField?.font = UIFont(name: "Helvetica Neue", size: 50)
        
    }

}

