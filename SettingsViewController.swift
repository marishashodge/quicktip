//
//  SettingsViewController.swift
//  quicktip
//
//  Created by Marisha Schumacher-Hodge on 9/19/16.
//  Copyright © 2016 Marisha Schumacher-Hodge. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipController: UISegmentedControl!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var saveMsg: UILabel!
    
    let tipPercentages = [0.18, 0.20, 0.22]
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        tipController.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSave(_ sender: AnyObject) {
        let defaultTip = tipController.selectedSegmentIndex
        
        defaults.set(defaultTip, forKey: "defaultTip")
        defaults.synchronize()
        
        saveMsg.text="Saved"
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
