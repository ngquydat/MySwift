//
//  FriendCell.swift
//  LoginSystem
//
//  Created by nguyen quy dat on 2/26/15.
//  Copyright (c) 2015 nguyen quy dat. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var ageLB: UILabel!
    @IBOutlet weak var avatarIMG: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(name: String, age: Int, avatar: String)
    {
        self.nameLB.text = name
        self.ageLB.text = String(age)
        self.avatarIMG.image = UIImage(named: avatar)
    }

}
