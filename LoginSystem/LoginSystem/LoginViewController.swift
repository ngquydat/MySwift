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

        if email.isEmpty || passwd.isEmpty
        {
            return
        }
        
        //Send data to server side
        let myUrl = NSURL(string: "http://datnq.swift.plaizer0.apdev.jp/userLogin.php")
        let request = NSMutableURLRequest(URL: myUrl!)
        request.HTTPMethod = "POST"
        
        let postString = "email=\(email)&password=\(passwd)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
            data, response, error in
            
            if error != nil
            {
                println("error=\(error)")
                return
            }
            
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &err) as? NSDictionary
            
            if let parseJSON = json {
                var resultValue: String = parseJSON["status"] as String
                println("result: \(resultValue)")
                
                if resultValue == "Success"
                {
                    //Login is successfull
                    NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isLoggedIn")
                    NSUserDefaults.standardUserDefaults().synchronize()
                    
                    self.dismissViewControllerAnimated(true , completion: nil)
                }
            }
        }
        
        task.resume()
        
//        let emailStored = NSUserDefaults.standardUserDefaults().stringForKey("email")
//        let passwdStored = NSUserDefaults.standardUserDefaults().stringForKey("password")
//        
//        //check empty field
//        
//        if email == emailStored && passwd == passwdStored
//        {
//            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isLoggedIn")
//            self.dismissViewControllerAnimated(true, completion: nil)
//        }
    }
    
}
