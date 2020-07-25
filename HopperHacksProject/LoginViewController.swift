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
        Auth.auth().signIn(withEmail: username.text!, password: password.text!) { (user, error) in
        guard let strongSelf = self else { return
           if error == nil{
             self.performSegue(withIdentifier: "loginToHome", sender: self)
                          }
            else{
             let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
             let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

              alertController.addAction(defaultAction)
              self.present(alertController, animated: true, completion: nil)
                 }
        }
    }

    }
}

