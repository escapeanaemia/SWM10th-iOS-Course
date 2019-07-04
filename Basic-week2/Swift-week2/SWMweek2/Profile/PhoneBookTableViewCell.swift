//
//  PhoneBookTableViewCell.swift
//  Profile
//
//  Created by sooyeon Shim on 02/07/2019.
//  Copyright © 2019 sooyeon Shim. All rights reserved.
//

import UIKit

class PhoneBookTableViewCell: UITableViewCell {

    // MARK:- Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
