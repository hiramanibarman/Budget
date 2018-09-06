//
//  ViewController.swift
//  Budget
//
//  Created by Hiramani Barman on 9/5/18.
//  Copyright © 2018 Hiramani Barman. All rights reserved.
//

import UIKit

let BudgetData: [Any] = [
    ["title": "Axis Bank", "dueDate": "00-00-0000", "amount": "100.00", "type": "creditCards"],
    ["title": "Axis Bank", "dueDate": "00-00-0000", "amount": "100.00", "type": "personalLoan"],
    ["title": "House rent", "dueDate": "00-00-0000", "amount": "100.00", "type": "rent"],
    ["title": "LIC", "dueDate": "00-00-0000", "amount": "100.00", "type": "savingsAndInsurance"],
    ["title": "Airtel Bill", "dueDate": "00-00-0000", "amount": "100.00", "type": "utility"],
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
//        data[.creditCards] = BudgetData.filter({ $0["type"] == "creditCards" })
//        data[.personalLoan] = BudgetData.filter({ $0["type"] == "personalLoan" })
//        data[.rent] = BudgetData.filter({ $0["type"] == "rent" })
//        data[.savingsAndInsurance] = BudgetData.filter({ $0["type"] == "savingsAndInsurance" })
//        data[.utility] = BudgetData.filter({ $0["type"] == "utility" })
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var count: Int {
            return TableSection.utility.hashValue + 1
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tableSection = TableSection(rawValue: section), let budgetData = data[tableSection] {
            return budgetData.count
        }
        return 0
    }
    
    func tableView(_tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let tableSection = TableSection(rawValue: section), let budgetData = data[tableSection] {
            return CGFloat(budgetData.count)
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect.init(x: 0,
                                             y: 0,
                                             width: (tableView.bounds.width - 30),
                                             height: SectionHeaderHeight))
        view.backgroundColor = UIColor(red: 253.0/255.0, green: 240.0/255.0, blue: 196.0/255.0, alpha: 1)
        let label = UILabel(frame: CGRect(x: 15,
                                          y: 0,
                                          width: (tableView.bounds.width - 30),
                                          height: SectionHeaderHeight))
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.black
        
        if let tableSection = TableSection(rawValue: section) {
            switch tableSection {
            case .creditCards:
                label.text = "Credit Cards"
            case .personalLoan:
                label.text = "Personal Loan"
            case .rent:
                label.text = "House Rent"
            case .savingsAndInsurance:
                label.text = "Savings/Insurance"
            case .utility:
                label.text = "Utility"
//            default:
//                label.text = ""
            }
        }
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if let tableSection = TableSection(rawValue: indexPath.section), let budget = data[tableSection]?[indexPath.row] {
            if let titleLabel = cell.viewWithTag(20) as? UILabel {
                titleLabel.text = budget["title"]
            }
            if let subtitleLabel = cell.viewWithTag(20) as? UILabel {
                subtitleLabel.text = budget["dueDate"]
            }
        }
      return cell
    }
}

