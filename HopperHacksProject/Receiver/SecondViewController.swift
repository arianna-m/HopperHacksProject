//
//  SecondViewController.swift
//  HopperHacksProject
//
//  Created by Arianna Martinelli on 7/22/20.
//  Copyright © 2020 HopperHacks. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bio: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        bio.text = "From Paradise, California\nRetired helium balloon salesman\nI wear glasses\nEnjoy playing tennis and watching TV"
    }


}

