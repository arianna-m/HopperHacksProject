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

    @IBAction func sendButtonTouchUp(_ sender: UIButton) {
        let fileID = Database.database().reference().child("Sent Letters/\(name)/\(Auth.auth().currentUser?.uid ?? "")")
        let letter = ["Message": messageTextField.text, "Email": emailTextField.text]
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
