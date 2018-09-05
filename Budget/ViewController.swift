//
//  ViewController.swift
//  Budget
//
//  Created by Hiramani Barman on 9/5/18.
//  Copyright © 2018 Hiramani Barman. All rights reserved.
//

import UIKit

let BudgetData: [Any] = [
    ["title": "Axis Bank", "Due date": "00-00-0000", "amount": "100.00", "type": "creditCards"],
    ["title": "Axis Bank", "Due date": "00-00-0000", "amount": "100.00", "type": "personalLoan"],
    ["title": "House rent", "Due date": "00-00-0000", "amount": "100.00", "type": "rent"],
    ["title": "LIC", "Due date": "00-00-0000", "amount": "100.00", "type": "savingsAndInsurance"],
    ["title": "Airtel Bill", "Due date": "00-00-0000", "amount": "100.00", "type": "utility"],
]

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    enum TableSection: Int {
        case creditCards = 0, personalLoan, rent, savingsAndInsurance, utility
    }
    
    let SectionHeaderHeight: CGFloat = 25
    
    var data = [TableSection: [[String:String]]] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        tableView.reloadData()
    }
    
    func sortData() {
        
        
    }


}

