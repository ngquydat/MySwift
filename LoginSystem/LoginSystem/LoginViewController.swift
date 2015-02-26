//
//  LoginViewController.swift
//  LoginSystem
//
//  Created by nguyen quy dat on 2/26/15.
//  Copyright (c) 2015 nguyen quy dat. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwdTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(sender: AnyObject)
    {
        let email = emailTF.text
        let passwd = passwdTF.text
        
        let emailStored = NSUserDefaults.standardUserDefaults().stringForKey("email")
        let passwdStored = NSUserDefaults.standardUserDefaults().stringForKey("password")
        
        //check empty field
        
        if email == emailStored && passwd == passwdStored
        {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isLoggedIn")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
}
