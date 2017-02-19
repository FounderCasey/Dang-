//
//  DangTableViewController.swift
//  Dang!
//
//  Created by Casey Wilcox on 2/15/17.
//  Copyright © 2017 Casey Wilcox. All rights reserved.
//

import UIKit
import Firebase

class DangTableViewController: UITableViewController {
    
    let ref = FIRDatabase.database().reference(withPath: "dang")
    
    var dangItems: [DangItem] = []
    var voteCount: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.ref.queryOrdered(byChild: "task").observe(.value, with: { snapshot in
            var items: [DangItem] = []
            
            for item in snapshot.children {
                let dangItem = DangItem(snapshot: item as! FIRDataSnapshot)
                items.append(dangItem)
            }
            self.dangItems = items
            self.tableView.reloadData()
        })
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dangItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DangTableViewCell
        let item = dangItems[indexPath.row]
        cell?.dangLabel.text = item.text
        cell?.scoreLabel.text = item.votes
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = dangItems[indexPath.row]
            item.ref?.removeValue()
        }
    }
    
    @IBAction func addVote(_ sender: Any) {
        //Add votes
        print("Voted For")
    }

}
