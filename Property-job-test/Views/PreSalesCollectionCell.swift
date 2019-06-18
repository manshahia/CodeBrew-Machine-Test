//
//  PreSalesCollectionCell.swift
//  Property-job-test
//
//  Created by Ravi Inder Manshahia on 19/06/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import UIKit

class PreSalesCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var nameOfDeveloper: UILabel!
    @IBOutlet weak var desc: UILabel!
   
    func configureCell(data: PreSalesModel)
    {
        
        
        imageView.kf.setImage(with: URL(string: data.imageURL ))
        desc.text = data.desc
        nameOfDeveloper.text = data.nameOfDeveloper
        
        if data.price > 100000
        {
            var price = data.price
            price = data.price % 100000
            self.price.text = String("$ \(price)M")
        }
        else
        {
            price.text = String("$\(data.price)")
        }
        
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
