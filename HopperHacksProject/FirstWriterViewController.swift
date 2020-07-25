//
//  FirstWriterViewController.swift
//  HopperHacksProject
//
//  Created by Arianna Martinelli on 7/25/20.
//  Copyright © 2020 HopperHacks. All rights reserved.
//

import UIKit

class FirstWriterViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
    }

}

    var names = ["Jane Taylor", "Kyle Tran", "Mary Lane", "Joe Brown", "Jamie Rose", "Chance Kim"]

extension UIViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellTableViewCell
        cell?.label.text = names[indexPath.row]
        cell?.img.image = UIImage(named: names[indexPath.row])
        return cell!
    }
}
