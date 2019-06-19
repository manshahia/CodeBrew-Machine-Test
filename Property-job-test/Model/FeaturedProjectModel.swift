//
//  FeaturedProjectModel.swift
//  Property-job-test
//
//  Created by Ravi Inder Manshahia on 19/06/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import Foundation

struct FeaturedProjectsModel {
    

    var totalProjects : String
    var locality : String
    var rate : Int
    
    init(_ dic: [String:Any])
    {

        self.totalProjects = dic["buildings_count"] as? String ?? ""
        self.locality = dic["name"] as? String ?? ""
        self.rate = dic["price_per_sqft"] as? Int ?? 0
    
    }
}
