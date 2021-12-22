//
//  SettingsViewController.swift
//  Prework
//
//  Created by Maddie Tong on 12/22/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipOne: UITextField!
    @IBOutlet weak var defaultTipTwo: UITextField!
    @IBOutlet weak var defaultTipThree: UITextField!
    
    // Set default tip percentages
    let TIP_ONE : Int = 15
    let TIP_TWO : Int = 18
    let TIP_THREE : Int = 20
    let defaults = UserDefaults.standard
    
    // Triggered right before screen mounted
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Get tip percentages stored
        defaultTipOne.text =  defaults.string(forKey: "defaultTipOne") ?? String(TIP_ONE)
        defaultTipTwo.text = defaults.string(forKey: "defaultTipTwo") ?? String(TIP_TWO)
        defaultTipThree.text = defaults.string(forKey: "defaultTipThree") ?? String(TIP_THREE)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
    }
    
    // Store new default tip percentage
    @IBAction func setTipOne(_ sender: Any) {
        defaults.set(Int(defaultTipOne.text!) ?? TIP_ONE, forKey: "defaultTipOne")
        defaults.synchronize()
    }
    
    // Store new default tip percentage
    @IBAction func setTipTwo(_ sender: Any) {
        defaults.set(Int(defaultTipTwo.text!) ?? TIP_TWO, forKey: "defaultTipTwo")
        defaults.synchronize()
    }
    // Store new default tip percentage
    @IBAction func setTipThree(_ sender: Any) {
        defaults.set(Int(defaultTipThree.text!) ?? TIP_THREE, forKey: "defaultTipThree")
        defaults.synchronize()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
