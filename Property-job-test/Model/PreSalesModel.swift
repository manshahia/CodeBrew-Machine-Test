//
//  PreSalesModel.swift
//  Property-job-test
//
//  Created by Ravi Inder Manshahia on 19/06/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import Foundation

struct PreSalesModel
{
    var imageURL : String
    var price: Int
    var nameOfDeveloper : String
    var desc: String
    
    init(_ dic: [String:Any])
    {
        self.imageURL = dic["main_image"] as? String ?? ""
        self.price = dic["max_price"] as? Int ?? 0
        self.nameOfDeveloper = dic["name"] as? String ?? ""
        self.desc = dic["desciption"] as? String ?? "2BD/2BA"
    }
}
