//
//  TopDevelopersCollectionCell.swift
//  Property-job-test
//
//  Created by Ravi Inder Manshahia on 18/06/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import UIKit

class TopDevelopersCollectionCell: UICollectionViewCell {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var yearEstablished: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var noOfProperties: UILabel!
    
    func configureCell(data: TopDevelopersModel)
    {
        
        
                imageView.kf.setImage(with: URL(string: data.imageURL ))
                yearEstablished.text = String(data.yearEstablished)
                name.text = data.name
                noOfProperties.text = String(data.noOfProperties)
    }
    
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
    
   

}
