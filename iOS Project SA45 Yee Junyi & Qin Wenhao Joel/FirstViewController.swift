//
//  FirstViewController.swift
//  iOS Project SA45 Yee Junyi & Qin Wenhao Joel
//
//  Created by Joel Qin on 8/2/18.
//  Copyright © 2018 Institute of Systems Science. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var nameForAttendance: UITextField!
    let dateFormatter = DateFormatter()
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
        if ((nameForAttendance.text?.count)! < 10 && (nameForAttendance.text?.count)! > 0)
        {
        nameForAttendance.resignFirstResponder()
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Attendance", in: managedObjectContext)
        
        let attend = AttendanceMO(entity: entityDescription!, insertInto: managedObjectContext) //diff from workshop
        
        attend.studentId = nameForAttendance.text
        attend.dateTime = dateFormatter.string(from:Date())
        
        do {
            try managedObjectContext.save()
            status.text = "Attendance Saved"
            
        } catch let error as NSError {
            status.text = "Error: " + error.localizedFailureReason!
            print ("Failed : \(error.localizedDescription)")
        }
    }
    else
        {
            status.text = "ID wrong. Please try again"
        }
        
   
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        nameForAttendance.resignFirstResponder()
        return true;
    }
}

