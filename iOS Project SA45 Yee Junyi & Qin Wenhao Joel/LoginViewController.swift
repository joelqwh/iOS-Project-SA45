//
//  LoginViewController.swift
//  iOS Project SA45 Yee Junyi & Qin Wenhao Joel
//
//  Created by junyi on 8/2/18.
//  Copyright © 2018 Institute of Systems Science. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var textFieldUserId: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    }
    
    @IBAction func Login(_ sender:Any){
        //let userid = textFieldUserId.text
        //let password = textFieldPassword.text
        let path = Bundle.main.path(forResource: "LoginAccount", ofType: "plist") as String!
        print("bundle plist:" + path!)
        print(Bundle.main.description)
        let dict : AnyObject = NSDictionary(contentsOfFile: path!)!
        
        if (textFieldUserId.text != dict.value(forKey: "UserID") as? String || textFieldPassword.text != dict.value(forKey: "Password") as? String
            ) {
            let alert = UIAlertController(title: "!!!", message: "Invalid Credentials", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            }
            alert.addAction(OKAction)
            
            self.present(alert, animated: true, completion: nil);
            return
        }
        
        if (textFieldUserId.text! == dict.value(forKey: "UserID") as? String! && textFieldPassword.text! == dict.value(forKey:"Password") as? String!) {
            
            performSegue(withIdentifier: "LoginSuccess", sender: self)
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
