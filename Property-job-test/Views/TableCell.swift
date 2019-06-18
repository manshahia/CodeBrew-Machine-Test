//
//  TableCell.swift
//  Property-job-test
//
//  Created by Ravi Inder Manshahia on 17/06/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    var collectionCellToLoadForRow = 0
    
    var recommendedPropertiesArray: [RecommendedModel?] = []
    {
        didSet{
            collectionView.reloadData()
        }
    }
    var topDevelopersArray: [TopDevelopersModel?] = []
    {
        didSet {
            collectionView.reloadData()
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib.init(nibName: "RecommendedCollectionCell", bundle: nil), forCellWithReuseIdentifier: "recommendedcollectioncell")
        
        collectionView.register(UINib.init(nibName: "TopDevelopersCollectionCell", bundle: nil), forCellWithReuseIdentifier: "topdeveloperscollectioncell")
        
    }
    
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionCellToLoadForRow {
        case 0:
            print("Items in Section 0 : \(recommendedPropertiesArray.count)")
            return recommendedPropertiesArray.count
        case 1:
            print("Items in Section 1 : \(topDevelopersArray.count)")
            return topDevelopersArray.count
        default:
            return 0
        }
    }
    
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionCellToLoadForRow {
        case 0:
        
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendedcollectioncell", for: indexPath) as? RecommendedCollectionCell
            {
                if let property = self.recommendedPropertiesArray[indexPath.row]
                {
                    cell.configureCell(data: property)
                    return cell
                }
            }
            
        case 1:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topdeveloperscollectioncell", for: indexPath) as? TopDevelopersCollectionCell
            {
                if let topDeveloper = self.topDevelopersArray[indexPath.row]
                {
                    cell.configureCell(data: topDeveloper)
                    return cell
                }
            }
            
        
        default:
            return UICollectionViewCell()
        }
        
        return UICollectionViewCell()
    }
    
  

}
