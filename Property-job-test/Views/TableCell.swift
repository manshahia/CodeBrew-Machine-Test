//
//  TableCell.swift
//  Property-job-test
//
//  Created by Ravi Inder Manshahia on 17/06/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
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
    var preSalesArray: [PreSalesModel?] = []
    var popularProjectsArray: [PopularProjectsModel?] = []
    var featuredProjectsArray: [FeaturedProjectsModel?] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib.init(nibName: "RecommendedCollectionCell", bundle: nil), forCellWithReuseIdentifier: "recommendedcollectioncell")
        
        collectionView.register(UINib.init(nibName: "TopDevelopersCollectionCell", bundle: nil), forCellWithReuseIdentifier: "topdeveloperscollectioncell")
        
        collectionView.register(UINib.init(nibName: "PreSalesCollectionCell", bundle: nil), forCellWithReuseIdentifier: "presalescollectioncell")
        
          collectionView.register(UINib.init(nibName: "PopularCollectionCell", bundle: nil), forCellWithReuseIdentifier: "popularprojectscell")
        
        
        collectionView.register(UINib.init(nibName: "FeaturedCollectionCell", bundle: nil), forCellWithReuseIdentifier: "featuredcollectioncell")
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionCellToLoadForRow {
        case 0:
            print("Items in Section 0 : \(recommendedPropertiesArray.count)")
            return recommendedPropertiesArray.count
        case 1:
            print("Items in Section 1 : \(topDevelopersArray.count)")
            return topDevelopersArray.count
        case 2:
            return preSalesArray.count
        case 3: return popularProjectsArray.count
        case 4: return featuredProjectsArray.count
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
        case 2:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "presalescollectioncell", for: indexPath) as? PreSalesCollectionCell
            {
                if let preSales = self.preSalesArray[indexPath.row]
                {
                    cell.configureCell(data: preSales)
                    return cell
                }
            }
        case 3:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularprojectscell", for: indexPath) as? PopularCollectionCell
            {
                if let popular = self.popularProjectsArray[indexPath.row]
                {
                    cell.configureCell(data: popular)
                    return cell
                }
            }
        case 4:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "featuredcollectioncell", for: indexPath) as? FeaturedCollectionCell
            {
                if let featured = self.featuredProjectsArray[indexPath.row]
                {
                    cell.configureCell(data: featured)
                    return cell
                }
            }
            
            
        
        default:
            return UICollectionViewCell()
        }
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionCellToLoadForRow
        {
        case 0:
            return CGSize(width: collectionView.frame.size.width/1.5, height:300)
        case 1:
            return CGSize(width: collectionView.frame.size.width / 2 - 20, height:200)
        case 2:
            return CGSize(width: collectionView.frame.size.width - 40, height:150)
        case 3:
            return CGSize(width: collectionView.frame.size.width - 40, height:100)
        case 4:
            return CGSize(width: collectionView.frame.size.width - 40, height:70)
        default:
            return CGSize(width: collectionView.frame.size.width / 2 - 20, height:200)
            
        }
        
    }
  

}

//extension TableCell {
//
//
//    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
//        collectionView.delegate = dataSourceDelegate
//        collectionView.dataSource = dataSourceDelegate
//        collectionView.setContentOffset(collectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
//        collectionView.reloadData()
//
//    }
//
//    var collectionViewOffset: CGFloat {
//        set { collectionView.contentOffset.x = newValue }
//        get { return collectionView.contentOffset.x }
//    }
//
//}
//
//extension TableCell:UICollectionViewDelegateFlowLayout{
//
//
//    func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
//        return true
//    }
//
//
//
//}
