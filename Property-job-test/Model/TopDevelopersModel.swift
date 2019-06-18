//
//  TopDevelopersModel.swift
//  Property-job-test
//
//  Created by Ravi Inder Manshahia on 18/06/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import Foundation

struct TopDevelopersModel
{
    var imageURL : String
    var name : String
    var noOfProperties : Int
    var yearEstablished : Int
    
    init(_ dic: [String:Any])
    {
        
        self.imageURL = dic["image"] as? String ?? ""
        self.name = dic["name"] as? String ?? ""
        self.noOfProperties = dic["total_properties_count"] as? Int ?? 0
        self.yearEstablished = dic["year_estd"] as? Int ?? 2000
    }
}
