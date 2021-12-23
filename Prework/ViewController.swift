//
//  ViewController.swift
//  Prework
//
//  Created by Maddie Tong on 12/22/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    // Default tip percentages
    let TIP_ONE : Int = 15
    let TIP_TWO : Int = 18
    let TIP_THREE : Int = 20
    var tipPercentages : [Int] = [15, 18, 20]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        // autofocus bill amount text field 
        billAmountTextField.becomeFirstResponder()
    }
    
    // Triggered right before screen mounted
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Get default tip percentages stored
        let defaults = UserDefaults.standard
        let tipOne = defaults.string(forKey: "defaultTipOne") ?? String(TIP_ONE)
        let tipTwo = defaults.string(forKey: "defaultTipTwo") ?? String(TIP_TWO)
        let tipThree = defaults.string(forKey: "defaultTipThree") ?? String(TIP_THREE)
        
        // Update percentage array
        tipPercentages[0] = Int(tipOne) ?? TIP_ONE
        tipPercentages[1] = Int(tipTwo) ?? TIP_TWO
        tipPercentages[2] = Int(tipThree) ?? TIP_THREE
        
        // Update control label
        tipControl.setTitle(tipOne + "%", forSegmentAt: 0)
        tipControl.setTitle(tipTwo + "%", forSegmentAt: 1)
        tipControl.setTitle(tipThree + "%", forSegmentAt: 2)
        
        // Update tip calculation
        updateAmount()
    }
    
    // Carry out tip calculation logic
    func updateAmount() {
        // Get bill amount from text input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get total amount by multiplying bill with selected tip percentage
        let tip = bill * Double(tipPercentages[tipControl.selectedSegmentIndex])/100
        let total = bill + tip
        
        // Display tip amount
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Display total amount
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func calculateTip(_ sender: Any) {
        updateAmount()
    }
}

