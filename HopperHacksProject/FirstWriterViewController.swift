//
//  FirstWriterViewController.swift
//  HopperHacksProject
//
//  Created by Arianna Martinelli on 7/25/20.
//  Copyright © 2020 HopperHacks. All rights reserved.
//

import UIKit

class FirstWriterViewController: UIViewController {
    
    var name = ["Jane Taylor", "Kyle Tran", "Mary Lane", "Joe Brown", "Jamie Rose", "Chance Kim"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    
}
