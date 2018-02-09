//
//  SecondViewController.swift
//  iOS Project SA45 Yee Junyi & Qin Wenhao Joel
//
//  Created by Joel Qin on 8/2/18.
//  Copyright © 2018 Institute of Systems Science. All rights reserved.
//

import UIKit
import CoreData

class attendanceRow : UITableViewCell{
    @IBOutlet weak var IDInList: UILabel!
    @IBOutlet weak var timeIn: UILabel!
    
}

let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

let entityDescription =
    NSEntityDescription.entity(forEntityName: "Attendance",
                               in: managedObjectContext)

let request = NSFetchRequest<NSFetchRequestResult>()


class SecondViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        request.entity = entityDescription
        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        var attendsNo : Int?
        
        do {
            let attends = try managedObjectContext.fetch(request)
            attendsNo = attends.count
        } catch let error as NSError {
            
        }
        
        return attendsNo!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! attendanceRow
        
        var attendanceList : NSArray?
        do
        {
            let attends = try managedObjectContext.fetch(request) as NSArray?
            attendanceList = attends
        }
        catch let error as NSError {
            
        }
        let attend = attendanceList!.object(at: indexPath.row)

//        let attend = fetchedResultsController.object(at: indexPath)
//
//                cell.IDInList.text = ((attend as AnyObject).value(forKey: "studentId") as! String)
//                cell.timeIn.text = ((attend as AnyObject).value(forKey: "dateTime") as! String)

        cell.IDInList.text = ((attend as AnyObject).value(forKey: "studentId") as! String)
        cell.timeIn.text = ((attend as AnyObject).value(forKey: "dateTime") as! String)
        
        return cell
    }


}

