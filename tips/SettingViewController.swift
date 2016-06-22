//
//  SettingViewController.swift
//  tips
//
//  Created by K-Laboratory on 6/21/16.
//  Copyright © 2016 K-Laboratory. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var rate1: UITextField!
    @IBOutlet weak var rate2: UITextField!
    @IBOutlet weak var rate3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view.
        
        let defaultSettings = NSUserDefaults.standardUserDefaults()
        if (defaultSettings.objectForKey("rate1") == nil || defaultSettings.objectForKey("rate2") == nil || defaultSettings.objectForKey("rate3") == nil){
            rate1.text = "18"
            rate2.text = "20"
            rate3.text = "25"

        }
        else if (defaultSettings.objectForKey("rate1") as! String == "" || defaultSettings.objectForKey("rate2") as! String == "" || defaultSettings.objectForKey("rate3") as! String == ""){
            rate1.text = "18"
            rate2.text = "20"
            rate3.text = "25"
            
        }
        else{
            let rate1saved = defaultSettings.objectForKey("rate1") as! String
            let rate2saved = defaultSettings.objectForKey("rate2") as! String
            let rate3saved = defaultSettings.objectForKey("rate3") as! String
            
            rate1.text = rate1saved
            rate2.text = rate2saved
            rate3.text = rate3saved
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTab(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func SettingChanged(sender: AnyObject) {
        
        let defaultSettings = NSUserDefaults.standardUserDefaults()
        defaultSettings.setObject(rate1.text, forKey: "rate1")
        defaultSettings.setObject(rate2.text, forKey: "rate2")
        defaultSettings.setObject(rate3.text, forKey: "rate3")
        defaultSettings.synchronize()
    }
    
    @IBAction func resetDefault(sender: AnyObject) {
        let defaultSettings = NSUserDefaults.standardUserDefaults()
        defaultSettings.setObject("18", forKey: "rate1")
        defaultSettings.setObject("20", forKey: "rate2")
        defaultSettings.setObject("25", forKey: "rate3")
        defaultSettings.synchronize()
        rate1.text = "18"
        rate2.text = "20"
        rate3.text = "25"
        
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    

}
