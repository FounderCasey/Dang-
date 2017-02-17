//
//  DangTableViewCell.swift
//  Dang!
//
//  Created by Casey Wilcox on 2/15/17.
//  Copyright © 2017 Casey Wilcox. All rights reserved.
//

import UIKit
import Firebase

class DangTableViewCell: UITableViewCell {

    @IBOutlet weak var dangLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let ref = FIRDatabase.database().reference(withPath: "dang")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func upVote(_ sender: Any) {
    }

    @IBAction func downVote(_ sender: Any) {
    }
}
