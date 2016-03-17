//  SignUpViewController.swift
//  Raptroop
//
//  Created by Natu Myers on 2016-02-19.
//  Copyright © 2016 Altermax. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit


class SignUpViewController: UIViewController {
    var onButtonTapped : (() -> Void)? = nil
    
    @IBOutlet weak var usernametextfield: UITextField!
    @IBAction func continueButtonTap(sender: AnyObject) {
        
        print("continuepress");
        digestUser()
        
        // IF NO ERROR W/ SQL VALIDATION
            //performSegueWithIdentifier("SegueAfterJoin", sender: self)
        
            // PASS VARS FROM THIS VIEW TO NEXT
            // self.passwordtextfield.text.toPass = newUsername

    }
    
    
    
    @IBOutlet weak var passwordtextfield: UITextField!
    @IBOutlet weak var emailtextfield: UITextField!
    @IBOutlet weak var loginMessage: UILabel!
    
    var inputboxes: [String:AnyObject] = [:]
    lazy var json : JSON = JSON.null
    
    // MUST HAVE HTTPS
    let endpoint = "https://api.com/api/users"


    
    func digestUser() {
         
        //let passwordInput = self.passwordtextfield.text
        //let usernameInput = self.usernametextfield.text
        //let emailInput = self.emailtextfield.text

        
        inputboxes = [
            "hashword": self.passwordtextfield.text!,
            "username": self.usernametextfield.text!,
            "email": self.emailtextfield.text!
        ]
        
        // POST requests dont need a response!
        Alamofire.request(.POST, endpoint, parameters: inputboxes)
            .responseJSON { response in
                if let JSON = response.result.value {
                    print("Success with JSON: \(JSON)")
                    
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
