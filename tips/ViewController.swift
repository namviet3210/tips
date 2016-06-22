//
//  ViewController.swift
//  tips
//
//  Created by K-Laboratory on 6/18/16.
//  Copyright © 2016 K-Laboratory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var shareTwo: UILabel!
    @IBOutlet weak var shareThree: UILabel!
    @IBOutlet weak var shareFour: UILabel!



    var tipPercentages = [0.18,0.2,0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        shareTwo.text = "$0.00"
        shareThree.text = "$0.00"
        shareFour.text = "$0.00"
        
        billField.becomeFirstResponder()
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        

        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount*tipPercentage
        var total = billAmount+tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        shareTwo.text = String(format:"$%.2f", total/2)
        shareThree.text = String(format:"$%.2f", total/3)
        shareFour.text = String(format:"$%.2f", total/4)
    }
    
    @IBAction func onTab(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        let defaultSettings = NSUserDefaults.standardUserDefaults()
        if (defaultSettings.objectForKey("rate1") == nil || defaultSettings.objectForKey("rate2") == nil || defaultSettings.objectForKey("rate3") == nil){
            tipControl .setTitle("18%", forSegmentAtIndex: 0)
            tipControl .setTitle("20%", forSegmentAtIndex: 1)
            tipControl .setTitle("25%", forSegmentAtIndex: 2)
            tipPercentages[0...2] = [0.18,0.2,0.25]
            
        }
        else if (defaultSettings.objectForKey("rate1") as! String == "" || defaultSettings.objectForKey("rate2") as! String == "" || defaultSettings.objectForKey("rate3") as! String == ""){
            tipControl .setTitle("18%", forSegmentAtIndex: 0)
            tipControl .setTitle("20%", forSegmentAtIndex: 1)
            tipControl .setTitle("25%", forSegmentAtIndex: 2)
            tipPercentages[0...2] = [0.18,0.2,0.25]
        }
            
        else{
            let rate1saved = defaultSettings.objectForKey("rate1") as! String
            let rate2saved = defaultSettings.objectForKey("rate2") as! String
            let rate3saved = defaultSettings.objectForKey("rate3") as! String
            tipControl .setTitle(rate1saved+"%", forSegmentAtIndex: 0)
            tipControl .setTitle(rate2saved+"%", forSegmentAtIndex: 1)
            tipControl .setTitle(rate3saved+"%", forSegmentAtIndex: 2)
            
            let rate1 = Double(rate1saved)!/100
            let rate2 = Double(rate2saved)!/100
            let rate3 = Double(rate3saved)!/100
            tipPercentages[0...2] = [rate1,rate2,rate3]
        }
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount*tipPercentage
        var total = billAmount+tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        shareTwo.text = String(format:"$%.2f", total/2)
        shareThree.text = String(format:"$%.2f", total/3)
        shareFour.text = String(format:"$%.2f", total/4)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
}

