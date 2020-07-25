//
//  SignUpUsername&PasswordViewController.swift
//  HopperHacksProject
//
//  Created by Arianna Martinelli on 7/24/20.
//  Copyright © 2020 HopperHacks. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpUsername_PasswordViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!


    @IBOutlet weak var IAmLabel: UILabel!
    
    @IBOutlet weak var userTypePickerView: UIPickerView!
    
    let job = ["Recieve letters", "Send letters"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return job[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return job.count
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

    
    @IBAction func secondNext(_ sender: UIButton) {
        if password.text != confirmPassword.text {
        let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
        }
        else{
            Auth.auth().createUser(withEmail: username.text!, password: password.text!){ (user, error) in
         if error == nil {
           self.performSegue(withIdentifier: "signupToHome", sender: self)
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

class HomeViewController: UIViewController, UIPickerViewDelegate {
func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    print(row)
    if row == 0 {
        let vcOne = storyboard?.instantiateViewController(withIdentifier: "First View Controller") as! FirstViewController
        present(vcOne, animated: true, completion: nil)
        // first selection, initialize the VC related with it
    } else if row == 1 {
        let vcTwo = storyboard?.instantiateViewController(withIdentifier: "FirstWriterViewController") as! FirstWriterViewController
        present(vcTwo, animated: true, completion: nil)
        // second selection, initialize the VC related with it
    } else {
        // other selections, you get the idea, you can also do switch-case
    }
}

}

