//
//  FirstViewController.swift
//  HopperHacksProject
//
//  Created by Arianna Martinelli on 7/22/20.
//  Copyright © 2020 HopperHacks. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class FirstViewController: UIViewController {
    
//    @IBOutlet weak var topLabel: UILabel!
//    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var senderName: UILabel!
    @IBOutlet weak var replyEmail: UILabel!
    @IBOutlet weak var message: UITextView!
    
    var currentName = "someone"
//    var lettercount = 1

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let ref2 = Database.database().reference().child("Users/\(Auth.auth().currentUser?.uid ?? "")")
        ref2.observeSingleEvent(of: .value) { (snapshot) in
            let userInfo = snapshot.value as! NSDictionary
            self.currentName = userInfo["First Name"] as! String
            self.currentName += " " + (userInfo["Last Name"] as! String)
            print(self.currentName)
        }
        
//        let ref = Database.database().reference().child("Sent Letters/\(currentName)")
//        ref.observeSingleEvent(of: .value) { (snapshot) in
//            let letters = snapshot.value as! NSDictionary
//            self.senderName.text = letters["Sender"] as? String
//            self.message.text = letters["Message"] as? String
//            self.replyEmail.text = letters["Email"] as? String
//        }
        senderName.text = "Sarah Smith"
        replyEmail.text = "sarahsmith@gmail.com"
        message.text = "Hi Mr. Fredricksen!! I love helium balloons, too! What TV shows have you been watching? I'd love to get to know more about you! We should play tennis sometime! Did you watch the US Open? Hope you're doing well!"
        
    }
    
    // attempted to list all letters in tableView, but ran out of time, and couldn't figure out how to do it with the Firebase Data Structure to allow for more than one letter per person
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return lettercount
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("in method!!")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "receivedLetter", for: indexPath) as! ReceiveTableViewCell
//        let ref2 = Database.database().reference().child("Users/\(Auth.auth().currentUser?.uid ?? "")")
//        ref2.observeSingleEvent(of: .value) { (snapshot) in
//            print("IN HERE")
//            let userInfo = snapshot.value as! NSDictionary
//            self.currentName = userInfo["First Name"] as! String
//            self.currentName += " " + (userInfo["Last Name"] as! String)
//            print(self.currentName)
//        }
//
//        let ref = Database.database().reference().child("Sent Letters/\(currentName)")
//        ref.observe(.value) { (snapshot) in
//            print("IN HEREEEEE")
//            let letters = snapshot.value as! NSDictionary
//            let keys = letters.allKeys as NSArray
//            self.lettercount = keys.count
//            let senderName = keys[indexPath.row] as? String
//            cell.name.text = "From: " + senderName!
//            let letterContents = letters[cell.name.text!] as! NSDictionary
//            cell.messagePreview.text = letterContents["Message"] as? String
//            print(cell.messagePreview.text)
//        }
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }

}

