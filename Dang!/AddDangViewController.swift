//
//  AddDangViewController.swift
//  Dang!
//
//  Created by Casey Wilcox on 2/15/17.
//  Copyright © 2017 Casey Wilcox. All rights reserved.
//

import UIKit
import Firebase

class AddDangViewController: UIViewController, UITextViewDelegate {

    let ref = FIRDatabase.database().reference(withPath: "dang")
    
    @IBOutlet weak var textView: UITextView!
    let votes = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textView.text = "Enter text here..."
    }
    
    @IBAction func submitDang(_ sender: Any) {
        if textView.text.isEmpty {
            displayAlert(title: "Oops...", message: "It looks like you forgot some characters.")
        } else {
            let dangItem = DangItem(text: self.textView.text, votes: self.votes)
            let itemRef = self.ref.child(self.textView.text.lowercased().replacingOccurrences(of: ".", with: "-"))
            itemRef.setValue(dangItem.toAnyObject())
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Enter text here..." {
            textView.text = nil
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
        }
        
        return true
    }
}

extension UIViewController {
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
