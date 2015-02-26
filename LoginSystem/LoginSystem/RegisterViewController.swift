//
//  RegisterViewController.swift
//  LoginSystem
//
//  Created by nguyen quy dat on 2/26/15.
//  Copyright (c) 2015 nguyen quy dat. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwdTF: UITextField!
    @IBOutlet weak var repasswdTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func register(sender: AnyObject) {
        let email = emailTF.text
        let passwd = passwdTF.text
        let repasswd = repasswdTF.text
        
        //check empty field
        if email.isEmpty || passwd.isEmpty || repasswd.isEmpty
        {
            showAlert("All fields is require")
            return
        }
        
        //check passwords match
        if passwd != repasswd
        {
            showAlert("Passwords do not match")
            return
        }
        
        //store data
        NSUserDefaults.standardUserDefaults().setObject(email, forKey: "email")
        NSUserDefaults.standardUserDefaults().setObject(passwd, forKey: "password")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        var myAlert = UIAlertController(title: "Alert", message: "Register is successful", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAct = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {
            action in
            self.dismissViewControllerAnimated(true, completion: nil)
        })
        
        myAlert.addAction(okAct)
        self.presentViewController(myAlert, animated: true, completion: nil)
        //login
    }
    
    @IBAction func login(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showAlert(message: String)
    {
        var myAlert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAct = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAct)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
