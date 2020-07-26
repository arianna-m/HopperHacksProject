//
//  SecondViewController.swift
//  HopperHacksProject
//
//  Created by Arianna Martinelli on 7/22/20.
//  Copyright © 2020 HopperHacks. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var ImagePicker = UIImagePickerController()
    
    @IBAction func getNewProfilePhoto(_ sender: UIButton) {
        ImagePicker.sourceType = .photoLibrary
        
        present(ImagePicker, animated: true, completion: nil)
    }
    
    @IBOutlet weak var profilePhoto: UIImageView!
    
    @IBOutlet weak var bio: UILabel!
    
    @IBOutlet weak var bioTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImagePicker.delegate = self
        // Do any additional setup after loading the view.
    
    
        
        
        func ImagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profilePhoto.image = selectedImage
        }
        // go back to our ViewController
        
        ImagePicker.dismiss(animated: true, completion: nil)
    }
     

}

    @IBAction func updateBio(_ sender: UIButton) {
        if let newTitle = bioTextField.text {
        bio.text = newTitle
    }
}
}
