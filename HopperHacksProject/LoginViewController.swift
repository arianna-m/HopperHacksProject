//
//  LoginViewController.swift
//  HopperHacksProject
//
//  Created by Arianna Martinelli on 7/24/20.
//  Copyright © 2020 HopperHacks. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
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

    
    @IBAction func loginAction(_ sender: UIButton) {
        // storing email and password
        guard let username = username.text else {return}
        guard let password = password.text else {return}
        var job = ""
        // signing in the user and dismissing unless an error occurs
        Auth.auth().signIn(withEmail: username, password: password) { (user, error) in
            
            if error == nil && user != nil{
                guard let uid = Auth.auth().currentUser?.uid else {return}
                let ref = Database.database().reference().child("Users/\(uid)").child("Job")
                ref.observeSingleEvent(of: .value) { (snapshot) in
                    job = snapshot.value as? String ?? ""
                }
                
                self.performSegue(withIdentifier: "to\(job)", sender: nil)
                
                self.dismiss(animated: true, completion: nil)

            }
            else{
                print(error!.localizedDescription)
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }

    }
}

