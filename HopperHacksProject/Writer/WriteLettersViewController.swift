//
//  WriteLettersViewController.swift
//  HopperHacksProject
//
//  Created by Eugenia Feng on 7/25/20.
//  Copyright © 2020 HopperHacks. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class WriteLettersViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    var name = "John Smith"
    var ref = Database.database().reference()
    let userID = Auth.auth().currentUser?.uid ?? ""
    var senderName = "No one"

    @IBAction func sendButtonTouchUp(_ sender: UIButton) {
        let ref2 = Database.database().reference().child("Users/\(Auth.auth().currentUser?.uid ?? "")")
        ref2.observeSingleEvent(of: .value) { (snapshot) in
            let senderInfo = snapshot.value as! NSDictionary
            self.senderName = senderInfo["First Name"] as! String
            self.senderName += " " + (senderInfo["Last Name"] as! String)
        }
        
        let fileID = Database.database().reference().child("Sent Letters/\(name)")
        let letter = ["Message": messageTextField.text, "Email": emailTextField.text, "Sender": senderName] as [String : String?]
        fileID.setValue(letter)
        
        self.dismiss(animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
