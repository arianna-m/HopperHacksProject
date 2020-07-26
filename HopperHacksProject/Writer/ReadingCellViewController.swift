//
//  ReadingCellViewController.swift
//  HopperHacksProject
//
//  Created by Eugenia Feng on 7/25/20.
//  Copyright © 2020 HopperHacks. All rights reserved.
//

import UIKit

class ReadingCellViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var bio: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    // John Smith is default name, will be changed when passed from First Writer View Controller
    var passedName = "John Smith"
    var bios = ["Jane Taylor": "From Santa Clara, California\nI have 2 loving granddaughters who like to play soccer\nMy favorite drink is iced tea\nI loved to play bridge with my friends on Thursday and bake lemon cookies", "Carl Fredricksen":"From Paradise, California\nRetired helium balloon salesman\nI wear glasses\nEnjoy playing tennis and watching TV"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = passedName
        bio.text = bios[passedName]
        img.image = UIImage(named: passedName)

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? WriteLettersViewController {
            vc.name = passedName
        }
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
