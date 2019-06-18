//
//  PopularProjectsModel.swift
//  Property-job-test
//
//  Created by Ravi Inder Manshahia on 19/06/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import Foundation

struct PopularProjectsModel {
    var imageURL : String
    
    var name : String
    var description : String
    var city : String
    var price : Int
    
    init(_ dic: [String:Any])
    {
        let cityDict = dic["city"] as! [String:Any]
        
        self.imageURL = dic["main_image"] as? String ?? ""
        self.name = dic["name"] as? String ?? ""
        self.description = dic["description"] as? String ?? ""
        self.city = cityDict["name"] as? String ?? ""
        self.price = dic["min_price"] as? Int ?? 0
        
    }
}
