//
//  DangItem.swift
//  Dang!
//
//  Created by Casey Wilcox on 2/15/17.
//  Copyright © 2017 Casey Wilcox. All rights reserved.
//

import Foundation
import Firebase

struct DangItem {
    
    let key: String
    let text: String
    let votes: String
    let ref: FIRDatabaseReference?
    
    init(text: String, votes: String, key: String = "") {
        self.key = key
        self.text = text
        self.votes = votes
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value as! [String:AnyObject]
        print(snapshot.value)
        key = snapshot.key
        text = snapshotValue["text"] as! String
        votes = snapshotValue["votes"] as! String
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "text": text,
            "votes": votes
        ]
    }
}
