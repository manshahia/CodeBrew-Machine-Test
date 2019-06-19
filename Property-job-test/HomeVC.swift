//
//  FirstViewController.swift
//  Property-job-test
//
//  Created by Ravi Inder Manshahia on 17/06/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import UIKit
import Kingfisher

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Vars
    @IBOutlet weak var table: UITableView!
    var dataModel = DataModel()
    
    //View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        table.rowHeight = UITableView.automaticDimension
        self.table.estimatedRowHeight = 200
        table.reloadData()
        
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.text = "Kanguroo"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        
        DataService.instance.fetchData(with: URL_HOME) { (success, dataModel) in
            
            if success
            {
                self.dataModel = dataModel
                DispatchQueue.main.async
                {
                    self.table.reloadData()
                }
            }
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    //Table Datasource Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataModel.recommendedModelArr.count > 0
        {
            return 1
        }
        else
        {
            return 0	
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = table.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as? TableCell
        {
            
            switch indexPath.section {
            case 0:
                if dataModel.recommendedModelArr.count > 0
                {
                    cell.recommendedPropertiesArray = dataModel.recommendedModelArr
                    print("The section being sent is \(indexPath.section)")
                    cell.collectionCellToLoadForRow = indexPath.section

                }
                return cell

            case 1:
                if dataModel.topDevelopersArr.count > 0
                {
                    cell.topDevelopersArray = dataModel.topDevelopersArr
                    print("Cell \(cell.topDevelopersArray)")
                    print("The section being sent is \(indexPath.section)")
                    cell.collectionCellToLoadForRow = indexPath.section
                }
                return cell
            case 2:
                if dataModel.preSalesArr.count > 0
                {
                    cell.preSalesArray = dataModel.preSalesArr
                    print("Cell \(cell.topDevelopersArray)")
                    print("The section being sent is \(indexPath.section)")
                    cell.collectionCellToLoadForRow = indexPath.section
                }
                return cell
            case 3:
                if dataModel.popularArr.count > 0
                {
                    cell.popularProjectsArray = dataModel.popularArr
                    cell.collectionCellToLoadForRow = indexPath.section
                }
                return cell
            case 4:
                if dataModel.featuredArr.count > 0
                {
                    cell.featuredProjectsArray = dataModel.featuredArr
                    cell.collectionCellToLoadForRow = indexPath.section
                }
                return cell

            default:
                return UITableViewCell()
            }
            
            
        }
        else
        {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 300
        case 1:
            return 250
        case 2:
            return 150
        case 3:
            return 100
        case 4: return 70
        default:
            return 170
        }
    }
  
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 100))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 20, y: 50, width: headerView.frame.width-20, height: 30)
        label.textAlignment = NSTextAlignment.left
        label.text = titleForHeaderInSection(section: section)
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 22.0)
        label.textColor = UIColor.black

        headerView.addSubview(label)
        return headerView
    }
    
    //Convineance Method
    func titleForHeaderInSection(section: Int) -> String
    {
        switch section {
        case 0:
            return "Recommended"
        case 1: return "Top Developers"
        case 2: return "Pre-Sales"
        case 3: return "Popular Projects"
        case 4: return "Featured Projects"
        default:
            return "Pre-Sales"
        }
    }
}








