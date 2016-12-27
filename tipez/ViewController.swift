//
//  ViewController.swift
//  tipez
//
//  Created by Brian Sai Kit Ho on 12/26/16.
//  Copyright © 2016 Brian Sai Kit Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var numberOfPeople: UITextField!
    @IBOutlet weak var priceForEach: UILabel!
    
    var total : Double = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        // Disappearing keyboard after clicking on main screen
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Array to hold different tip percentage
        let tipPercentages = [0.18, 0.2, 0.25]
    
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        priceForEach.text = String(format: "$%.2f" + " /Person", total)
    }
    
    // This function calls when the segmented option ischanged
    @IBAction func differentTipPercent(_ sender: Any) {
        calculateTip(Any.self)
    }
    
    // This function is called when # of people
    // is enter
    @IBAction func calculateForEach(_ sender: Any) {
        let numOfPeople = Double(numberOfPeople.text!) ?? 0
        if numOfPeople == 0{
            priceForEach.text = String(format: "$%.2f" + " /Person", total)
        }
        else{
            let amount = total / numOfPeople
            priceForEach.text = String(format: "$%.2f" + " /Person", amount)
        }
    }
    
}











