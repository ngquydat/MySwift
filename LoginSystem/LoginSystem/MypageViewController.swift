//
//  ViewController.swift
//  LoginSystem
//
//  Created by nguyen quy dat on 2/26/15.
//  Copyright (c) 2015 nguyen quy dat. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var friendsList: [Friend] = [Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loadFriendsList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        let isLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isLoggedIn")
        
        if !isLoggedIn
        {
            self.performSegueWithIdentifier("loginView", sender: self)
        }
    }
    @IBAction func logout(sender: AnyObject)
    {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isLoggedIn")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        self.performSegueWithIdentifier("loginView", sender: self)
    }
    
    func loadFriendsList()
    {
        var friend1 = Friend(name: "Dat", age: 24, avatar: "img1.png")
        var friend2 = Friend(name: "Le", age: 22, avatar: "img2.png")
        
        friendsList.append(friend1)
        friendsList.append(friend2)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: FriendCell = tableView.dequeueReusableCellWithIdentifier("FriendCell") as FriendCell
        
        if indexPath.row % 2 == 0
        {
            cell.backgroundColor = UIColor.purpleColor()
        }
        else
        {
            cell.backgroundColor = UIColor.orangeColor()
        }
        
        let friend = friendsList[indexPath.row]
        cell.setCell(friend.name, age: friend.age, avatar: friend.avatar)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsList.count
    }
}

