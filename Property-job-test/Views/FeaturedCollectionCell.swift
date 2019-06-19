//
//  FeaturedCollectionCell.swift
//  Property-job-test
//
//  Created by Ravi Inder Manshahia on 19/06/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import UIKit

class FeaturedCollectionCell: UICollectionViewCell {

    @IBOutlet weak var totalProjects: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var locality: UILabel!
    
    override func awakeFromNib() {
        contentView.layer.cornerRadius = 6.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width:0,height: 3.0)
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false;
        layer.shadowPath = UIBezierPath(roundedRect:bounds, cornerRadius:contentView.layer.cornerRadius).cgPath
    }
    
    func configureCell(data: FeaturedProjectsModel)
    {
        totalProjects.text = data.totalProjects
        locality.text = data.locality
        rate.text = String("$ \(data.rate) / sqft.")
    }
}
