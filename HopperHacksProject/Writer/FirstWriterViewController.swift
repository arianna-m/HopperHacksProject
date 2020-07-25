//
//  FirstWriterViewController.swift
//  HopperHacksProject
//
//  Created by Arianna Martinelli on 7/25/20.
//  Copyright © 2020 HopperHacks. All rights reserved.
//

import UIKit

class FirstWriterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var names = ["Jane Taylor", "Kyle Tran", "Mary Lane", "Joe Brown", "Jamie Rose", "Chance Kim"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellTableViewCell
        cell.label.text = names[indexPath.row]
        cell.img.image = UIImage(named: names[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "cellmove", sender: tableView.cellForRow(at: indexPath))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? CellTableViewCell {
            if let vc = segue.destination as? ReadingCellViewController {
                vc.name.text = cell.label.text
            }
        }
    }
}


//
//extension UIViewController: UITableViewDelegate, UITableViewDataSource {
//
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return names.count
//    }
//
//
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellTableViewCell
//        cell?.label.text = names[indexPath.row]
//        cell?.img.image = UIImage(named: names[indexPath.row])
//        return cell!
//    }
//}
