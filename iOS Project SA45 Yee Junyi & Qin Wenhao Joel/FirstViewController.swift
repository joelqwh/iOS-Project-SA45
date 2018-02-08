//
//  FirstViewController.swift
//  iOS Project SA45 Yee Junyi & Qin Wenhao Joel
//
//  Created by Joel Qin on 8/2/18.
//  Copyright © 2018 Institute of Systems Science. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var nameForAttendance: UITextField!
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
        
        nameForAttendance.delegate = self
        
        
    }
    
    @objc func updateLabel() -> Void {
        currentTime.text = dateFormatter.string(from: Date())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmAttendance(_ sender: Any) {
        nameForAttendance.resignFirstResponder()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        nameForAttendance.resignFirstResponder()
        return true;
    }
}

