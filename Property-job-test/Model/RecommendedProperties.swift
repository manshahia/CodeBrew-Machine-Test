//
//  Property.swift
//  Property-job-test
//
//  Created by Ravi Inder Manshahia on 18/06/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import Foundation

struct RecommendedProperties
{
    var imageURL : String
    var location : String
    var name : String
    var description : String
    var city : String
    var price : Int

    init(_ dic: [String:Any])
    {
        let cityDict = dic["city"] as! [String:Any]
        let locationDict = dic["locality"] as! [String:Any]
        let configurationDict = dic["configuration"] as! [String:Any]
        
        self.imageURL = dic["image"] as? String ?? ""
        self.location = locationDict["name"] as? String ?? ""
        self.name = dic["name"] as? String ?? ""
        self.description = configurationDict["name"] as? String ?? ""
        self.city = cityDict["name"] as? String ?? ""
        self.price = dic["min_price"] as? Int ?? 0

    }
}
