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
    
    var properties: [RecommendedProperties?] = []
    {
        didSet{
            collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       

        if properties.count > 0
        {
            return properties.count
        }
        else
        {
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as? CollectionCell
        {
            if properties.count > 0
            {
                cell.city.text = properties[indexPath.row]?.city
                
                cell.imageView.kf.setImage(with: URL(string: properties[indexPath.row]?.imageURL ?? ""))

                cell.location.text = properties[indexPath.row]?.location
                cell.propertyDescription.text = properties[indexPath.row]?.description
                
                if let price = properties[indexPath.row]?.price
                {
                    cell.price.text = String(price)
                }
//
//                cell.comapny.text = properties[indexPath.row]?.
//
//                var imageURL : String
//                var location : String
//                var name : String
//                var description : String
//                var city : String
//                var price : Int
            }
            return cell
        }
        else
        {
            return UICollectionViewCell()
        }
        
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
