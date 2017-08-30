//
//  ViewController.swift
//  NewExpand
//
//  Created by appinventiv on 30/08/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    var expandedSections : NSMutableSet = []
    var sectionData : [String] = ["Vegs", "Fruits",  "Birds", "Reptiles", "Bikes"]
    var row1 = ["Tomato", "Onion", "Potato", "Pumpkin", "Babycorn", "Cucumber", "Carrot", "Beans", "Cabbage", "Corn", "EggPlant"]
    var row2 = ["Mango", "Orange", "Watermelon", "Apple", "Apricot", "Banana", "Papaya", "Pineapple", "Melon", "Avocado", "Cherry", "Date", "Fig", "Grape"]
    var row3 = ["Parrot", "Peacock", "Woodpecker", "Kingfisher", "Owl", "Eagle", "Pigeon", "Vulture", "Bats", "Nightingale", "Crow"]
    var row4 = ["Lizard", "Crocodile", "Snake", "Turtle", "Dinosaur"]
    var row5 = ["Apache", "Pulsar", "Platina", "Splendor", "Shine", "Dream yuga", "Bullet", "Himalyan", "Dominor"]
    
    @IBAction func btnTapped(_ sender: UIButton) {
        print("Section tapped")
        let sec = sender.tag
        print(sec)
        let shouldExpand = !expandedSections.contains(sec)
        print(shouldExpand)
        if (shouldExpand) {
            expandedSections.removeAllObjects()
            print(expandedSections)
            print(sec)
            expandedSections.add(sec)
            print(expandedSections)
            
        } else  {
            expandedSections.removeAllObjects()
            //print(expandedSections)
        }
        self.tableViewOutlet.reloadData()
        }
    @IBOutlet weak var tableViewOutlet: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionData.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CellData else { fatalError() }
        
        if (expandedSections.contains(section)) {
            
            cell.imagebtnCustom.image = UIImage(named: "down-arrow")
        }
        else {
           cell.imagebtnCustom.image = UIImage(named: "right-arrow")
            
        }
//        let headerTitle = UILabel.init(frame: CGRect(x: 38, y: 4, width: 250, height: 28))
//        headerTitle.textColor = UIColor.red
        cell.btnoutlet.tag = section
        cell.btnoutlet.backgroundColor = UIColor.brown
        cell.btnoutlet.tintColor = UIColor.black
        cell.btnoutlet.setTitle(sectionData[section], for: .normal)
        //headerTitle.text = sectionData[section]
  return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(expandedSections.contains(section)) {
            switch section {
            case 0:
                return row1.count
            case 1:
                return row2.count
            case 2:
                return row3.count
            case 3:
                return row4.count
            default:
                return row5.count
            }
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CellData else { fatalError() }
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.brown
        cell.tintColor = UIColor.black
        switch indexPath.section {
        case 0:
            print("case 0")
           cell.btnoutlet.setTitle(row1[indexPath.row], for: .normal)
            
        case 1:
            print("1")
            cell.btnoutlet.setTitle(row2[indexPath.row], for: .normal)
        case 2:
            
            cell.btnoutlet.setTitle(row3[indexPath.row], for: .normal)
            
        case 3:
            cell.btnoutlet.setTitle(row4[indexPath.row], for: .normal)
            
            
        default:
            cell.btnoutlet.setTitle(row5[indexPath.row], for: .normal)
            
            
        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 3
    }
}

class CellData: UITableViewCell {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var btnoutlet: UIButton!
    @IBOutlet weak var imagebtnCustom: UIImageView!
    
}

