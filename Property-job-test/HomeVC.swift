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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = table.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as? TableCell
        {
            
            if recommendedDataArray.count > 0
            {
                cell.properties = recommendedDataArray
            }
            return cell
        }
        else
        {
            return UITableViewCell()
        }
        
    }
    
    @IBOutlet weak var table: UITableView!
    var recommendedDataArray : [RecommendedProperties] = []
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        DataService.instance.fetchData(with: URL_HOME) { (success, dataArray) in
            
            for dic in dataArray {
                
                let property = RecommendedProperties(dic)
                self.recommendedDataArray.append(property)
        }
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
        
        
//        let url = URL(string: "https://apitest.sozu.com/storage/uploads/1559904279s9FeFvWE20edxZQWRgh7Ivm2fAgcMj.jpeg"
//)
//        imageView.kf.setImage(with: url)
        // Do any additional setup after loading the view, typically from a nib.
    }




